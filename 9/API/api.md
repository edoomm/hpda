# HTTP-API Flask microservice
In the following notebook a prototype of a HTTP-API service with POST and GET methods is implemented using Flask microservice.

The first thing to do is install Flask with pip3 via:
```bash
pip3 install --user flask
```
Now that we have Flask installed let's create a simple web application, which we will put in a file called [app.py](app.py).

In my case I needed to specify a port since port `5000` was used by another application. I found it was being in used with the following command `netstat -ano | findstr :5000`

For creating a new task:
````bash
curl -i -H "Content-Type: application/json" -X POST -d "{""title"":""Read a book""}" http://localhost:5001/todo/api/v1.0/tasks
````

Same for updating:
```bash
curl -i -H "Content-Type: application/json" -X PUT -d "{""done"":true}" http://localhost:5001/todo/api/v1.0/tasks/2
```
> **❔** Think about the syntax and semantics of the HTTP-API service specified in the tutorial. How are these supported by the HTTP methods?

They align with the functions defined, specifically with `get_tasks`, `get_task`, `create_task`, `update_task` and `delete_task`; where you are able to see how the methods are put into practice.

#  HTTP-API for a hierarchical file system
> **❔** Think about how a HTTP-API service could be used to expose a hierarchical file system, i.e., being able to upload/download files/directories. How could the syntax and semantics of the API look like?

It would be using a similar structure and similar functions to the program seen in the tutorial, but here we would make requests to the Hadoop File System (Database) instead of memory structure (Dictionary within our app.py)

Requests via **curl** could be made in the following way:
- To create a directory: `curl -i -X PUT "http://<namenode-host>:<port>/webhdfs/v1/<path>?op=MKDIRS"`
- To list the contents of a directory: `curl "http://<namenode-host>:<port>/webhdfs/v1/<path>?op=LISTSTATUS"`
- To read a file: `curl "http://<namenode-host>:<port>/webhdfs/v1/<path>?op=OPEN"`
- To write a file: `curl -i -X PUT -T <local-file> "http://<namenode-host>:<port>/webhdfs/v1/<path>?op=CREATE"`