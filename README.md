A fleshed-out template for a Flask app which uses Docker for deployments. Uses
Gunicorn and Nginx, managed by Supervisor.

The namespace for this example project is `proj`. Be sure to change this as
necessary in all config files.

Usage
---

Run `make run` to build and run the docker container. Alternatively, you can
use `make build` to bulid the container without running it.

Development
---

Traditional development workflow consists of creating a virtualenv for
local Python module dependencies. First install the [virtualenv package](https://pypi.python.org/pypi/virtualenv) and then run the following
commands to create and activate the virtualenv `venv`.

```
virtualenv venv
source venv/bin/activate
```

Use Pip to install any dependencies needed for your project, and then run
`pip freeze > requirements.txt` so they will be installed when the container
is built.

You can now make any changes to your project, and then run `make run` to
build and run the docker container. Test your application by going to
`http://<container_ip>`.

Configuration
---

The Flask app is housed in the `proj` directory. If you would like to use
another namespace, you will need to update references to this directory in
`proj/views.py`, `Dockerfile`, `conf/supervisord.conf`, and `tests/test.py`.

The default configuration for Gunicorn binds the app to local port 5000.
You can configure the Gunicorn command (i.e. to set number of workers) in
`conf/supervisord.conf`.

Nginx is configured to proxy pass the application server which it expects to be
running on local port 5000. You can configure this in `conf/nginx.conf`.
