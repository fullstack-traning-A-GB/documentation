# Fullstack test, for GBC

## Requirements to run this project

This project is made using:

- Backend:
  - Java 11 - Used **[AdoptOpenJdk](https://adoptopenjdk.net/ "The Open jvm")** Hotspot.
  - SpringBoot 2.3.8.RELEASE
  - Gradle 6.7.1
  - PostgreSQL 13.1

- Frontend:
  - Node Package Manager (npm 6.14.10) for NodeJs 14.15.4 (LTS)
  - Angular CLI 9.1.13 (LTS)

IDE and tools used:

- IntelliJ IDEA Ultimate 2020.3.2 (latest)
- Visual Studio Code (VScode)

## Run Backend part :fearful:

To run this project execute the `ddl.sql` under the [deployment](/deploy/) folder, keep in mind is needed to be admin on your Postgres DB instace, since you will create a new DB also new User, so run the DB and user creations scripts first then the DDL one.

1. run [db_creation](/deploy/db_creation_q.sql)
2. then run [ddl](/deploy/ddl_2.sql)

As is noticed, it is necessary to use Java (11) to run the backend.

Backend is a pure SpringBoot Project and is done in [Gradle](https://gradle.org/releases/ "Awesome gradle") so i recommend to run way command line after cloned as follows:

### 1. Clone the backend repository:

```console
git clone https://github.com/fullstack-traning-A-GB/backend_api_wrapper_bnc.git
cd ${yourDirectoryRootPath}/backend_api_wrapper_bnc
gradle bootRun 
```

if everything fits and goes right, then you might see something like:

![An awesome project](/tests/evidences/success_run.png?raw=true)

### 2. Then you can check by registering a new user :open_mouth:

```console
$windows
curl -X POST ^
-H "content-type: application/json" ^
-d "{\"username\":\"testuser\",\"password\":\"testpass\",\"firstname\":\"test firstname\",\"lastname\":\"test lastname\",\"favoriteCurrencySymbol\":\"COP\"}"
"http://localhost:8080/user/signUp" ^
```


As you can see in the next pick, you can see a beautiful log with an insertion query of the register user
![An awesome evidence](/tests/evidences/success_register.png?raw=true)

### 3. and make your login into the app :eyes:

```shell
$windows
curl -X POST ^
-H "content-type: application/json" ^
-d "{\"username\":\"testuser\",\"password\":\"testpass\"}"
http://localhost:8080/user/login
```

And you get your token :sunglasses:

```json
{
    "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0ZXN0dXNlciIsImV4cCI6MTYxMTk2MzAzN30.-bH348JsTRj72GTkG1KWxMD3Cg3FSpNEWDxrJTKRhC74-b-qo53fqnO8YxIp0TrMJnMLKv5VrFk_DyPx42ib2Q",
    "expirationTime": "2021-01-29T23:30:37.564+00:00",
    "type": "Bearer"
}
```

so use that token to acces the other resources (services/endpoints) around the app.

the swagger url is `http://localhost:8080/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config#`

## Run Frontend Part

~~under construction~~