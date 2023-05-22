**Storage Partitioning and Management**

We have decided to use ZFS as our file system, also I have designed the
storage hierarchy of our feeds. I’ll be mentioning how file system, and
other storage management logics will be working.

Partitioning of Drives: For production server we will setup the servers
and drives on own. Though there will be a script/program which will help
us to automate the server setup for the first time use.

Programs like fdisk, cfdisk etc. but I’ll be using sfdisk as it offer a
non-interactive methods to partition our drive. Like we can first
manually partition and structure our drive at first and then we can make
a backup copy of that structure and later can be applied on the same.

I have tested that on our current server at IITB Electrical Lab on the
HDD i.e. TOSHIBA MG04ACA200E (FP5B). Below are the current structure
which is in raidz1.

| label: gpt |                                                                                                                                     |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------- |
|            | label-id: E3B7FE9A-1618-4E8B-9EC7-4CA0340043DF                                                                                      |
|            | device: /dev/sdb                                                                                                                    |
|            | unit: sectors                                                                                                                       |
|            | first-lba: 34                                                                                                                       |
|            | last-lba: 3907029134                                                                                                                |
|            |                                                                                                                                     |
|            | /dev/sdb1 : start= 2048, size= 195313664, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=010F6E0C-BE91-42D9-9F1B-6885ACB3387F      |
|            | /dev/sdb2 : start= 195315712, size= 195313664, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=C183F619-DBD8-4728-82B8-BD369B5458D4 |
|            | /dev/sdb3 : start= 390629376, size= 195313664, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=DFFCD8B4-7800-4784-9236-CFC86C7F0C0F |
|            | /dev/sdb4 : start= 585943040, size= 195313664, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=B598E863-37D6-4D27-9299-D9D5B636A410 |
|            | /dev/sdb5 : start= 781256704, size= 195313664, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=8E9C1E9E-FFE9-49F3-85CE-1AFEFF13EEC3 |
|            | /dev/sdb6 : start= 976570368, size= 195313664, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=851EF8D8-CE80-49C7-9750-40C3B9996FFD |

Using the command: sfdisk -d /dev/sdb \>
IITB\_Sample\_Server\_partition\_with\_raidz1\_layout.sfd\_layout

And can be applied using: sfdisk -d /dev/sdb \<
IITB\_Sample\_Server\_partition\_with\_raidz1\_layout.sfd\_layout

As sfdisk is a part of util-linux just like fdisk, so availability
should be the same.

**Mount points**

Sample partition structure below, parted using sfdisk.

![](media_assets/File_system_Design_Logic_new.docx/media/image1.png)

Zpool status, formatted using zpool tool.

![](media_assets/File_system_Design_Logic_new.docx/media/image2.png)
