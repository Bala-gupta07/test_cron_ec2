#!/bin/bash

echo "===== Python Debug ====="
whoami
echo "PATH=$PATH"

which python3
python3 --version

echo "Python executable:"
python3 -c "import sys; print(sys.executable)"

echo "Python paths:"
python3 -c "import sys; print('\n'.join(sys.path))"

echo "Testing boto3:"
python3 -c "import boto3; print(boto3.__file__)"

echo "===== Running application ====="
python3 /home/ec2-user/cron_app/publish_sns_python.py