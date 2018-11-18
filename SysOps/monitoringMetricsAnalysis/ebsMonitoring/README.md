## Ebs Notes

> Four types of EBS: 
    * gp2 
    * io1 
    * st1
    * sc1

* Maximum size for any of the disks is 16TB or 16834 gib.
* GP2 ssd volumes have a base of 3 IOPS per/gib of volume size. 
* Maximum IOPS size of 10,000 IOPS, after that you need to go to provisioned IOPS

> The only time you have to pre-warm is when restoring from snapshots, even then you can avoid this if you get your instance to read the entire volume before using it, this is called initialisation.


## EBS Cloudwatch Metrics 

* VolumeReadBytes & VolumeWriteBytes. Provides information on IO levels over a specified period of time. 
* VolumeReadOps & VolumeWriteOps. This is the total number of I/O operations over a specified period of time.
* VolumeTotalReadTime VolumeTotalWriteTime. Total number of seconds spent by all operations completed in a specified time. 
* VolumeIdleTime: The total number of seconds in a specified period of time when no read or write operations were submitted.
* VolumeQueueLength: The number of read and write operation requests waiting to be completed. IMPORTANT FOR EXAM.
* VolumeTrhoughputPercentage: Used with provisionedIOPS ssd only. Percentage of IO operations per second thats delivered of the total IOPS provisioned for an ebs volume.
* VolumeConsumedReadWriteOps: Provisioned IOPS ssd only. Amount of read and write operations consumed in a specified time (normalized to 256K capacity units)

## Volume Status Checks 

* OK is self explanitory 
* WARNING: Degraded (Performance is below expectations), Severely Degraded(Well below expectations)
* Impaired: Stalled(Performance is severely impacted), Not Available: (Unable to determine I/O because IO is disabled)
* Insufficient-data self explantory

Exam tip: If status is degraded or severely degraded then it is in Warning, if stalled or N/A it is impaired.