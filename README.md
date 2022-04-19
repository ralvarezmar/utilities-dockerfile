# bastion-pod-dockerfile

## Main Software
| name                    | version    | description               | install script                        |
|-------------------------|------------|---------------------------|---------------------------------------|
| kubectl                 | 1.14.9     | k8s client                | ./root/kubectl.sh                     |
| helm                    | 3.2.1      | Helm 3                    | ./root/helm.sh                        |
| helm                    | 2.14.3     | Helm 2                    | ./root/helm.sh                        |
| renderizer              | 2.0.9      | Helm template renderizer  | ./root/renderizer.sh                  |
| yq                      | 3.3.0      | Yaml processor            | ./root/yq.sh                          |
| go                      | 1.14.9     | Go runtime and tools      | ./root/go.sh                          |
| jsonnet                 | 0.16.0     | Data templating language  | ./root/jsonnet.sh                     |
| krew                    | latest     | k8s plugin manager        | ./user/krew.sh                        |
| jb                      | latest     | jsonnet-bundler           | ./user/jb.sh                          |
| ansible2                | latest     | jsonnet-bundler           | ./root/amazon-linux-extras.sh         |
| istioctl                | 1.1.7      | Istio control             | ./root/istioctl.sh                    |
| aws-iam-authenticator   | 1.16.8     | AWS Authenticator         | ./root/aws-iam-authenticator.sh       |
| nvm                     | 0.35.3     | Node Version Manager      | ./user/nvm.sh                         |
| jdk8                    | 1.8.0      | Java Developer Kit        | ./root/jsk8maven.sh                   |
| mvn                     | 3.3.9      | Maven                     | ./root/jsk8maven.sh                   |
| bind-utils              | latest     | nslookup...               | ./root/main.sh                        |
| deploymicro             | latest     | deploy micro from git     | dockerfile                            |

## Build
```bash
docker build --pull --rm -f "Dockerfile" -t bastionpoddockerfile:latest "."
```

## Run
```bash
docker run -it --rm -u ec2-user bastionpoddockerfile:latest
```