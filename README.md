# Adhearsion Load Testing with SIPP

This application's purpose is to provide a ready-built load testing environment to use with SIPp.

## SIPp

SIPp, available at [http://sipp.sourceforge.net/](http://sipp.sourceforge.net/), is a command-line tool for testing and traffic generation for the SIP protocol.

It offers many useful features that allow for various scenarios to be tested.
In this specific application, we will be using SIPp as a client to simulate many calls over a period of time, with limited interaction with the Adhearsion app.

### Obtaining and compiling SIPp

Comprehensive installation instructions are available [here](http://sipp.sourceforge.net/doc/reference.html#Installation).
The load tests have been developed using the unstable/SVN branch, which is thus recommended.
Prerequisites are mostly standard and included in most Linux/OSX installations.

PCAP Play capabilities are needed for this app, so the command used for compiling SIPp will be "make pcapplay". That is the only step needed, there is no ./configure script.
Authentication is not currently used or needed by the app.
There is no "make install" step available, you can link the bin/sipp executable to any PATH directory.

## Asterisk configuration

It is recommended to use a very minimal Asterisk configuration, such as the one bundled.
The application is set up to use 1, 2,3 and 4 as the routes to the controllers.

Depending on your setup, you might either need allowguest=yes in your sip.conf general settings ot setting up a password-less peer.

## Running the tests

SIPp uses scenario files that reside in the sipp/ directory, together with the needed sound files.
Since the paths to the sound captures are relative in the scenarios, you should only run the commands from inside the sipp/ directory.

The EXAMPLE file in the same directory shows an example command.

sudo sipp -i 127.0.0.1 -sf load-test-1-simple.xml -l 5 -m 100 -r 2 -s 1 -p 8832 127.0.0.1 -trace_err

First, please note that due to descriptor allocation and interface binding issues, the tests run as root using sudo.
The following is a description of the used flags, for other options please refer to the [SIPp documentation](http://sipp.sourceforge.net/doc/reference.html#Online+help+%28-h%29).

-i Interface to bind the client to, useful to avoid confusion if running on the same machine as the tests, which is not recommended

-sf Scenario file to use

-l Maximum simultaneous number of calls

-m Maximum total number of calls to process

-r Rate per second of calls to be started

-s Extension or username part of the SIP address to dial

-p Local port number, also used to avoid conflicts

-trace_err (single dash) Logs the errors to a file named <scenario file name>_<pid>_errors.log

The last argument is the host or IP to dial.
