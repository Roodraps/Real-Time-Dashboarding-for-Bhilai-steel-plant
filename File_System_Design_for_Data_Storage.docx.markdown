**File System for the data storage**

As we are going to have millions of records in our Time series database
and also for video storage, we need to decide on a better file system
for the storage. So far, I have come with traditional ext4 along with
BRTFS as well as ZFS.

I have decided to have a separate partition for the /data /archives and
/database that we will have and mount it there not with the root (/) of
the system which will make data retrieval easier in the case of a crash.
and if we suffer from a failed release upgrade or any worst-case
scenario.

The BRTFS is based on the copy-on-write principle FS, better for having
regular snapshots of the data we have on our system and also fewer
chances of data corruption. Meanwhile, ZFS also have fewer chances of
data corruption. I’ll list down the limitations, etc of these
filesystems. Looking at the limitations of all we can assume these are
enough for us.

**Limitations**

**ZFS**

  - 16 exbibytes (2<sup>64</sup> bytes): maximum size of a single file

  - 2<sup>48</sup>: number of entries in any individual directory

  - 16 exbibytes: maximum size of any attribute

  - 2<sup>56</sup>: number of attributes of a file (actually constrained
    to 2<sup>48</sup> for the number of files in a directory)

**BRTFS**

  - Max. volume size: 16 EiB

  - Max. file size: 16 EiB

  - Max. number of files: 2<sup>64</sup>

  - Max. filename length: 255 ASCII characters (fewer for multibyte
    character encodings such as Unicode)

  - Allowed characters in filenames All except '/' and NUL ('\\0')

**EXT4**

  - Max. volume size: 1 EiB (for 4 KiB block size)

  - Max. file size: 16 TiB (for 4 KiB block size)

  - Max. number of files: 4 billion (specified at filesystem creation
    time)

  - Max. filename length: 255 bytes

  - Allowed characters in filenames All bytes except NUL ('\\0') and '/'
    and the special file names "." and ".." which are not forbidden but
    are always used for a respective special purpose.
