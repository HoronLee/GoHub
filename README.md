# GoHub

> 这是一个基于[Summer大佬的Gohub教学项目](https://github.com/summerblue/gohub)的单体 Web 应用快开框架

## 更改部分

- 没有做手机号注册的完整逻辑
- 没有添加路由限流功能
- 优化短信发送逻辑，支持配置文件选择TLS方式连接SMTP服务器
- 没有添加数据库迁移命令功能

## 架构思想

本框架采用经典的 **API-focused MVC (Model-View-Controller)** 架构，旨在实现快速开发。与 Kratos 等采用严格分层的框架不同，我们将业务逻辑、请求处理和响应都集中在 **Controller** 中，以简化开发流程，提高中小型项目的迭代效率。

- **Models (`app/models/`)**: 数据层，负责数据库交互。
- **Controllers (`app/http/controllers/`)**: 核心逻辑层，处理 HTTP 请求、执行业务并返回响应。
- **Requests (`app/requests/`)**: 验证层，用于在 Controller 执行前对输入数据进行验证。

## 编码顺序 (推荐开发流程)

为了保证代码的一致性和结构清晰，强烈建议遵循以下“约定优于配置”的开发流程。请务必使用框架提供的代码生成器。

当开发一个新功能时（例如“商品管理”），顺序如下：

1.  **创建数据模型 (Model):**
    - **目的:** 定义数据结构及数据库映射。
    - **命令:** `go run main.go make model Product`
    - **效果:** 在 `app/models/product/` 目录下生成模型文件，你只需在 `product_model.go` 中填写结构体字段。

2.  **创建请求验证器 (Request):**
    - **目的:** 为 API 请求创建专属的验证规则。
    - **命令:** `go run main.go make request ProductRequest`
    - **效果:** 在 `app/requests/` 目录下生成 `product_request.go`，你可以在此定义不同场景的验证规则。

3.  **创建控制器 (Controller):**
    - **目的:** 编写核心业务逻辑。
    - **命令:** `go run main.go make apicontroller api/v1/ProductsController`
    - **效果:** 在 `app/http/controllers/api/v1/` 目录下生成 `products_controller.go`。在此实现 `Index`, `Store`, `Update`, `Delete` 等方法。

4.  **注册路由 (Route):**
    - **目的:** 将 URL 路径与控制器方法关联。
    - **操作:** 编辑 `routes/api.go` 文件，在 `v1` 路由组中添加新规则。

## 项目结构概览

```
/Users/horonlee/projects/gohub/
├───app/                      # 核心业务代码 (MVC)
│   ├───cmd/                  # 自定义 Artisan 命令
│   ├───http/                 # HTTP 请求处理
│   │   ├───controllers/      # 控制器 (业务逻辑)
│   │   └───middlewares/      # 中间件
│   ├───models/               # 数据模型 (ORM)
│   └───requests/             # 请求验证
├───bootstrap/                # 程序初始化 (数据库, 路由, 日志)
├───config/                   # 所有配置文件
├───pkg/                      # 可复用的基础包 (Auth, JWT, Redis, etc.)
├───routes/                   # 路由定义
├───storage/                  # 文件存储 (日志)
├───main.go                   # 程序入口
└───README.md                 # 项目文档
```

## 基本用法

### 使用 Docker

1.  **构建 Docker 镜像:**

    ```bash
    docker build -t gohub:latest .
    ```

2.  **启动服务:**

    ```bash
    docker-compose up -d
    ```

### 本地开发

1.  **安装依赖:**

    ```bash
    go mod tidy
    ```

2.  **运行服务:**

    ```bash
    go run main.go serve
    ```

## 配置文件示例

`.env`

```env
app_env=local
app_key=alskdjfakjsjashbdfas
app_debug=true
app_url=http://localhost:3000
app_log_level=debug
app_port=8000

db_connection=mysql
db_host=192.168.6.166
db_port=3306
db_database=gohub
db_username=gohub
db_password=aslkashfdsa
db_debug=2

log_type=daily
log_level=debug

redis_host=192.168.6.166
redis_password=alsdkjfhkasd

MAIL_HOST=smtp.qq.com
MAIL_PORT=465
MAIL_FROM_ADDRESS=horonlee@foxmail.com
MAIL_FROM_NAME=GoHub
MAIL_USERNAME=horonlee@foxmail.com
MAIL_PASSWORD=paosdfalsdkjf
MAIL_TLS=true
```