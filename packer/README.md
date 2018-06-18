# Nexus AMI
Contains [Packer](https://www.packer.io) scripts for create an AWS [Nexus](https://books.sonatype.com/nexus-book/reference3/index.html) AMI.

## AMI Details
64-bit CentOS Linux 7 box with the latest version of Nexus installed. Nexus binaries are installed at /opt/nexus and the Nexus data directory is located at /opt/sonatype-work. Data directory is kept on a seperate volume and is pesisted even after instance termination in order to preserve Nexus data.

## Developer Setup
1. [Install Packer](https://www.packer.io/intro/getting-started/install.html)
2. [Create an AWS Access Key](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html)

## Build Instructions

1. Create a JSON file that contains the following user variable values:
    ```json
    {
        "aws_access_key": "<AWS Access Key value>",
        "aws_secret_key": "<AWS Secret Key value>"
    }
    ```
2. Blah Blah
    ```bash
    packer build -var-file <path to variable JSON file> nexus.json
    ```


