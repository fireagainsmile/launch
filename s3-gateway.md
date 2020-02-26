# s3 网关

s3 网关(gateway) 提供了 s3兼容的[api](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html) 来对存储的某个订单进行管理, 开发者可以针对s3api来开发应用。
也就是说，使用标准的s3的sdk或工具, 或者自己构造s3标准的请求就可以跟s3网关交互。

s3网关使用minio来提供api，其中有若干api不支持，详细可以[参考](https://github.com/minio/minio/blob/master/docs/minio-limits.md#list-of-amazon-s3-apis-not-supported-on-minio)。
而目前阶段，lambda s3 网关支持的功能、接口也有限，基本的文件操作api之外的api大部分目前不支持，请避免使用。


## 配置与运行

针对s3网关的配置默认在 `~/.lambda_storagecli/config/user.toml` 的 `[gateway]` 部分，解释如下：
```ini
[gateway]
# 服务监听的地址
address = "127.0.0.1:9002"
# 用于访问服务的key
access_key = "accesskey"
secret_key = "secretkey"
```

若`user.toml`配置正常，可以在命令行调用 `./storagecli gateway run  --account env --broker.extra_order_id XXX --debug` 来启动，这就启动了针对某个订单的s3网关服务

启动的更多参数可以通过`./storagecli gateway run -h`查看

## aws cli 示例

首先，先安装[awscli](https://docs.aws.amazon.com/cli/latest/userguide/installing.html).

之后，配置用于访问s3网关的key：
```
$ aws configure
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]:
Default output format [None]:
```

之后就可以进行基本的文件操作了

#### 创建bucket

`aws s3 --endpoint=http://localhost:9002/ mb s3://awstest`

#### 上传文件

`aws s3 --endpoint=http://localhost:9002/ cp /path/to/your/file s3://awstest`

#### 列出bucket内容

`aws s3 --endpoint=http://localhost:9002/ ls s3://awstest`

#### 下载文件

`aws s3 --endpoint=http://localhost:9002/ cp s3://awstest/your-file /tmp/new-file`

#### 分享文件

`aws s3 --endpoint=http://localhost:9002/ presign s3://awstest/your-file`

支持在线播放

#### 删除文件


## aws python sdk 示例

首先，安装boto3 `pip install boto3`

```python3
"""
refer https://docs.min.io/docs/how-to-use-aws-sdk-for-python-with-minio-server.html
"""

import boto3
from botocore.client import Config

s3 = boto3.resource('s3',
                    endpoint_url='http://localhost:9002',
                    aws_access_key_id='accesskey',
                    aws_secret_access_key='secretkey',
                    config=Config(signature_version='s3v4'),
                    region_name='')

# create bucket
s3.Bucket('awstest').create()

# list bucket
print("buckets:", [bucket.name for bucket in s3.buckets.all()])

# upload file
s3.Bucket('awstest').upload_file('/path/to/your/file','images/your-file')

# list file
print("objects in bucket: awstest", [obj.key for obj in s3.Bucket('awstest2').objects.filter(Prefix='images/')])

# download file
s3.Bucket('awstest').download_file('images/your-file', '/tmp/newfile')
```



也可以使用minio提供的sdk，[minio文档](https://docs.min.io/docs/python-client-quickstart-guide)有详细的示例，这里不在赘述

