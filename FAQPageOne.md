# Why Runit? #

For us, the LFS-Runit team, our search for a better solution to init was not easy. We researched several possibilities even using bsdinit with perp as a solution, but in reality, we only saw this as a temporary stop gap to the problem of init.

  * Why Runit and not ...?

_Runit is small in code size, very simplistic in design, and contains enough compatibility, if scripted properly, to support not only Runit service run files, but sysvinit scripts if necessary._

  * What is a Run file?

_A Run file is a small script containing only the necessary execution parameters of launching a service (daemon)._

  * What is a Finish file?

_A finish file is a set of instructions to cleanup after a daemon exits, usually disposing of temporary setting files, logs (when necessary), PID files (if they exist), and other data that is irrelevant after the service is stopped._

  * What is a log file?

_A log script is a specialized run script that is issued to track the execution state of a service in a pipe._

  * What is a pipe?

