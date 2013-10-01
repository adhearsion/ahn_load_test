# Adhearsion Load Testing

This application's purpose is to establish the performance of Adhearsion applications accross supported platforms.

## Load Generation

[SIPp](http://sipp.sourceforge.net/) is a command-line tool for testing and traffic generation for the SIP protocol. [SippyCup](http://mojolingo.github.io/sippy_cup) is a Ruby wrapper for SIPp integrating simpler scenario preparation and reporting functionality.

Load generation scenarios included in this project utilise SippyCup for their execution. SippyCup and SIPp come pre-installed on the Loadtest VM from [Telephony Dev Box](http://mojolingo.github.io/Telephony-Dev-Box).

## System under test

Use the Asterisk and FreeSWITCH VMs from [Telephony Dev Box](http://mojolingo.github.io/Telephony-Dev-Box). Boot the Adhearsion application as follows:

```
AHN_PUNCHBLOCK_PLATFORM=asterisk AHN_PUNCHBLOCK_USERNAME=manager AHN_PUNCHBLOCK_PASSWORD=password AHN_PUNCHBLOCK_HOST=asterisk.local-dev.mojolingo.com ahn start .

# or

AHN_PUNCHBLOCK_PLATFORM=xmpp AHN_PUNCHBLOCK_USERNAME=usera@freeswitch.local-dev.mojolingo.com AHN_PUNCHBLOCK_PASSWORD=1 ahn start .
```

## Running the tests

STALE. Rewrite for SippyCup.

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
