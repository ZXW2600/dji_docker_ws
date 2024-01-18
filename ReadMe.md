# DJI RMUA Workspace

## Docker Environment
### 镜像构建

#### 1. 构建运行依赖环境（不含源代码）：

```shell
cd ./docker/ros_pytorch/
./build.sh
```
如果编译不通过，如curl\wget报错，请使用代理编译
```shell
cd ./docker/ros_pytorch/
docker build --build-arg http_proxy="http://ip:port"  -t rmua_devel .
```

#### 2. 复制工程代码到src文件夹，完整的目录结构如下
```markdown
.
├── docker
├── entrypoint
├── src
```

#### 3. 代码的编译

由于docker环境中库版本与宿主机中不同，因此编译也要在docker中进行

```shell
./catkin_docker.sh
```

编译后目录结构如下,当前目录下的所有文件都会直接映射到docker中的/catkin_ws目录：
```
.
├── build
├── devel
├── docker
├── entrypoint
├── src
```


#### 4. 代码的运行
在工作空间根目录下执行

```shell
./run_controller.sh
```

该脚本会将当前目录映射为/catkin_ws

#### 5. 使用docker环境进行调试
如果需要使用docker环境进行调试，需要链接到docker中的bash，可以使用如下脚本：
```shell
./run_bash.sh
```
该脚本会**启动**docker容器并打开一个bash终端。

如果需要打开更多的终端，请使用
```shell
./exec_bash.sh
```

#### 6. 代码的提交
当向大疆比赛提交镜像时，需要编译含有代码的镜像，1中编译的镜像仅包含依赖环境
```shell
./build_image.sh #构建镜像
./test_image.sh  #运行镜像程序
./save_image.sh  #生成提交的压缩包
```




