Runit-for-LFS is a public open source project to get Runit fully available as an alternative init system to sysvinit, and promote Runit's usage within other distributions, looking for an non-invasive init solution that is simple and easy to use.

Runit is a UNIX init and service supervision suite developed by Gerrit Pape. Runit has been supported on Linux and BSD fully, with some support for service supervision only in Solaris and OS-X.

The homepage for Runit is: http://smarden.org/runit

The home page for Linux From Scratch is: http://www.linuxfromscratch.org

The goal of our Runit implementation is to streamline the initialization process for core components in Stage 1 with all services under supervisor mode in Stage 2. Our goal is to eliminate the need for excess usage of PID files by utilizing Runit's ability to assign dedicated execution state pipelines to services.

While our primary objective is to bring Runit to LFS, you are free to use our work to implement Runit on any distribution of your choice using our work as an example.

The current release(s) can be downloaded here:

https://runit-for-lfs.googlecode.com/svn/releases/runit-for-lfs-1.0rc1.tar.bz2

If you would like to join and help out with the project please contact us first.

**Due to the fact Runit is under a different license than our own you will need to acquire a release of Runit itself, from the Runit homepage.**