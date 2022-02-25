Robot Framework
===============

.. contents::
   :local:

Introduction
------------

`Robot Framework <http://robotframework.org>`_ is a generic open source
automation framework for acceptance testing, acceptance test driven
development (ATDD), and robotic process automation (RPA). It has simple plain
text syntax and it can be extended easily with libraries implemented using
Python or Java.

Robot Framework is operating system and application independent. The core
framework is implemented using `Python <http://python.org>`_, supports both
Python 2.7 and Python 3.5+, and runs also on `Jython <http://jython.org>`_ (JVM),
`IronPython <http://ironpython.net>`_ (.NET) and `PyPy <http://pypy.org>`_.
The framework has a rich ecosystem around it consisting of various generic
libraries and tools that are developed as separate projects. For more
information about Robot Framework and the ecosystem, see
http://robotframework.org.

Robot Framework project is hosted on GitHub_ where you can find source code,
an issue tracker, and some further documentation. See `<CONTRIBUTING.rst>`__
if you are interested to contribute. Downloads are hosted on PyPI_, except
for the standalone JAR distribution that is on `Maven central`_.

Robot Framework development is sponsored by `Robot Framework Foundation
<http://robotframework.org/foundation>`_.

.. _GitHub: https://github.com/robotframework/robotframework
.. _PyPI: https://pypi.python.org/pypi/robotframework
.. _Maven central: http://search.maven.org/#search%7Cga%7C1%7Ca%3Arobotframework

.. image:: https://img.shields.io/pypi/v/robotframework.svg?label=version
   :target: https://pypi.python.org/pypi/robotframework
   :alt: Latest version

.. image:: https://img.shields.io/pypi/l/robotframework.svg
   :target: http://www.apache.org/licenses/LICENSE-2.0.html
   :alt: License

Installation
------------
Download and install python::

    https://www.python.org/downloads/

    python setup.py install

The recommended installation method is using pip_::

    pip install selenium
    
    pip install robotframework

    pip install --robotframework-seleniumlibrary

Running this command installs also the latest Selenium and Robot Framework
versions, but you still need to install `browser drivers`_ separately.
The ``--upgrade`` option can be omitted when installing the library for the
first time.

Those migrating from Selenium2Library_ can install SeleniumLibrary so that
it is exposed also as Selenium2Library::

    pip install --upgrade robotframework-selenium2library

The above command installs the normal SeleniumLibrary as well as a new
Selenium2Library version that is just a thin wrapper to SeleniumLibrary.
That allows importing Selenium2Library in tests while migrating to
SeleniumLibrary.

Browser drivers
---------------

After installing the library, you still need to install browser and
operating system specific browser drivers for all those browsers you
want to use in tests. These are the exact same drivers you need to use with
Selenium also when not using SeleniumLibrary. More information about
drivers can be found from `Selenium documentation`__.

The general approach to install a browser driver is downloading a right
driver, such as ``chromedriver`` for Chrome, and placing it into
a directory that is in PATH__. Drivers for different browsers
can be found via Selenium documentation or by using your favorite
search engine with a search term like ``selenium chrome browser driver``.
New browser driver versions are released to support features in
new browsers, fix bug, or otherwise, and you need to keep an eye on them
to know when to update drivers you use.

Alternatively, you can use a tool called WebdriverManager__ which can
find the latest version or when required, any version of appropriate
webdrivers for you and then download and link/copy it into right
location. Tool can run on all major operating systems and supports
downloading of Chrome, Firefox, Opera & Edge webdrivers.

Here's an example:

.. code:: bash

      pip install webdrivermanager
      webdrivermanager firefox chrome --linkpath /usr/local/bin

__ https://seleniumhq.github.io/selenium/docs/api/py/index.html#drivers
__ https://en.wikipedia.org/wiki/PATH_(variable)
__ https://github.com/omenia/webdrivermanager


Example
-------

Below is a simple example test case for testing login to some system.
You can find more examples with links to related demo projects from
http://robotframework.org.

.. code:: robotframework

    *** Settings ***
    Documentation     A test suite with a single test for valid login.
    ...
    ...               This test has a workflow that is created using keywords in
    ...               the imported resource file.
    Resource          resource.robot

    *** Test Cases ***
    Valid Login
        Open Browser To Login Page
        Input Username    demo
        Input Password    mode
        Submit Credentials
        Welcome Page Should Be Open
        [Teardown]    Close Browser

Usage
-----

Tests (or tasks) are executed from the command line using the ``robot``
command or by executing the ``robot`` module directly like ``python -m robot``
or ``jython -m robot``.

The basic usage is giving a path to a test (or task) file or directory as an
argument with possible command line options before the path::

    robot tests.robot
    robot --variable BROWSER:Firefox --outputdir results path/to/tests/

Additionally there is the ``rebot`` tool for combining results and otherwise
post-processing outputs::

    rebot --name Example output1.xml output2.xml

Run ``robot --help`` and ``rebot --help`` for more information about the command
line usage. For a complete reference manual see `Robot Framework User Guide`_.

Documentation
-------------

- `Robot Framework User Guide
  <http://robotframework.org/robotframework/#user-guide>`_
- `Standard libraries
  <http://robotframework.org/robotframework/#standard-libraries>`_
- `Built-in tools
  <http://robotframework.org/robotframework/#built-in-tools>`_
- `API documentation
  <http://robot-framework.readthedocs.org>`_
- `General documentation and demos
  <http://robotframework.org/#documentation>`_

Support and contact
-------------------

- `robotframework-users
  <https://groups.google.com/group/robotframework-users/>`_ mailing list
- `Slack <https://robotframework-slack-invite.herokuapp.com>`_ community
- `#robotframework <http://webchat.freenode.net/?channels=robotframework&prompt=1>`_
  IRC channel on freenode
- `@robotframework <https://twitter.com/robotframework>`_ on Twitter
- `Other forums <http://robotframework.org/#support>`_
