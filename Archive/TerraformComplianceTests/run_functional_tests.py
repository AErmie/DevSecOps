import os
import sys
import subprocess
import colorful
import re


def prep_tests(test_dir):
    tests = []

    # ALB, S3, etc. (outer dir)
    for feature in os.listdir(test_dir):
        if os.path.isdir('{}/{}'.format(test_dir, feature)):
            # passing_setups, failing_setups
            for setups in os.listdir('{}/{}'.format(test_dir, feature)):
                if os.path.isdir('{}/{}/{}'.format(test_dir, feature, setups)):
                    # ALB_setup_1, S3_setup_3, etc. (inner test dir)
                    for setup in os.listdir('{}/{}/{}'.format(test_dir, feature, setups)):
                        if os.path.isdir('{}/{}/{}/{}'.format(test_dir, feature, setups, setup)):
                            # test location
                            # feature is ../../
                            tests.append('{}/{}/{}/{}'.format(test_dir, feature, setups, setup))

    return tests


def run_tests(tests):
    test_summary = []
    failure_happened = False

    for test_dir in tests:
        parameters = ['terraform-compliance', '--no-ansi']
        
        # Ignore if there are any .terraform folders in this level. They can build up when writing tests.
        if '.terraform' in test_dir:
            continue

        feature_directory = '{}/../..'.format(test_dir)
        test_result = ''

        expected = ''
        unexpected = ''

        if not os.path.isfile('{}/plan.out.json'.format(test_dir)):
            test_result = colorful.orange('skipped')
        else:
            if os.path.isfile('{}/.failure'.format(test_dir)):
                parameters.append('--wip')

            if os.path.isfile('{}/.expected'.format(test_dir)):
                with open('{}/.expected'.format(test_dir)) as expected_file:
                    expected = expected_file.read().split('\n')

            if os.path.isfile('{}/.unexpected'.format(test_dir)):
                with open('{}/.unexpected'.format(test_dir)) as unexpected_file:
                    unexpected = unexpected_file.read().split('\n')

            if not os.path.isfile('{}/.no_early_exit'.format(test_dir)):
                parameters.append('-q')

            parameters.extend([
                '-f', '{}'.format(feature_directory),
                '-p', '{}/plan.out.json'.format(test_dir)
            ])

            try:
                print('Running {}.'.format(colorful.yellow(test_dir)))
                # TODO: Add multithreading here if we have more than 50+ integration tests ?
                test_process = subprocess.run(parameters,
                                            check=True,
                                            # shell=True,
                                            stdout=subprocess.PIPE,
                                            universal_newlines=True,
                                            )

                if os.environ.get('DEBUG'):
                    print('Output: {}'.format(colorful.grey(test_process.stdout)))

                if test_process.returncode == 0:
                    if expected:
                        expected_failures = [
                            exp for exp in expected 
                            if not re.findall(exp, str(test_process.stdout))
                        ]

                        if expected_failures:
                            print('\nOutput: {}'.format(test_process.stdout))
                            print('Can not find ;')
                            for failure in expected_failures:
                                print('\t{}'.format(colorful.yellow(failure)))
                            print('in the test output.\n')

                            test_result = colorful.red('failed')
                            failure_happened = True

                    if unexpected:
                        unexpected_failures = [
                            unexp for unexp in unexpected 
                            if re.findall(unexp, str(test_process.stdout))
                        ]

                        if unexpected_failures:
                            print('\nOutput: {}'.format(test_process.stdout))
                            print('Found;')
                            for failure in expected_failures:
                                print('\t{}'.format(colorful.yellow(failure)))
                            print('in the test output. This was unexpected.\n')

                            test_result = colorful.red('failed')
                            failure_happened = True
                    
                    if not failure_happened:
                        test_result = colorful.green('passed')

                else:
                    print('Output: {}'.format(test_process.stdout))
                    test_result = colorful.red('failed')
                    failure_happened = True

            except subprocess.CalledProcessError as e:
                failure_happened = True

                if e.returncode != 1:
                    test_result = colorful.orange('errored')
                else:
                    test_result = colorful.red('failed')
                    print('Expected a different return code. Received {}'.format(colorful.yellow(e.returncode)))

                print('Output: {}'.format(e.stdout))

        test_summary.append('{:.<70s}{:.>10s}'.format(test_dir, test_result))

    return failure_happened, test_summary


if __name__ == "__main__":
    if sys.argv[1] == 'all':
        providers = ['aws', 'azure']
    else:
        providers = [sys.argv[1]]
    
    test_dirs = ['tests/{}'.format(provider) for provider in providers]

    tests_ran = 0
    summary = []
    failure_happened = False
    for provider in providers:
        test_suite_dir = 'tests/{}'.format(provider)
        tests = prep_tests(test_suite_dir)

        print('Running functional tests in {}.'.format(test_suite_dir))
        print('{} tests will be executed.'.format(len(tests)))

        failure, test_summary = run_tests(tests)
        failure_happened = failure_happened or failure
        summary.extend(test_summary)
        tests_ran += len(tests)


    print('\n\nRan {} tests.'.format(tests_ran))
    print('\n'.join(sorted(summary)))

    if failure_happened:
        sys.exit(1)
