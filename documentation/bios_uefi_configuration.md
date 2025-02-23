# BIOS/UEFI Configuration Changes - Server RAM Replacement

This document outlines the BIOS/UEFI configuration changes made after replacing the faulty RAM module in the server.

## 1. Initial BIOS/UEFI Verification

* **1.1 Access BIOS/UEFI:**
    * After powering on the server, press the appropriate key (e.g., Del, F2, F10, F12) to enter the BIOS/UEFI setup.
* **1.2 Memory Information:**
    * Navigate to the section displaying system memory information.
    * Verify that the newly installed RAM module is recognized.
    * Confirm that the total system memory capacity matches the expected value.
    * Check the speed of the RAM to verify it is running at the correct speed.

## 2. Configuration Adjustments

* **2.1 Memory Remapping (if applicable):**
    * If the system was previously using memory remapping due to the faulty module, verify that it is now disabled or adjusted appropriately.
* **2.2 Memory Timings (if necessary):**
    * If the new RAM module has different timings than the previous module, adjust the memory timings in the BIOS/UEFI according to the manufacturer's specifications.
    * This is usually only changed if different types of RAM are used.
* **2.3 Boot Order:**
    * Ensure that the boot order is correct, prioritizing the operating system drive.
    * If the server boots from the network, verify the network boot settings.
* **2.4 Memory Diagnostic Settings:**
    * If the BIOS/UEFI has built-in memory diagnostic tools, verify that they are enabled or configured as needed.

## 3. Saving and Exiting

* **3.1 Save Changes:**
    * Save the configuration changes and exit the BIOS/UEFI setup.
* **3.2 System Reboot:**
    * Allow the system to reboot and proceed with the operating system startup.

## 4. Post-Configuration Verification

* **4.1 Operating System Memory Verification:**
    * After the operating system has started, verify that the system is recognizing the correct amount of RAM.
    * In Linux, use `free -h` or `cat /proc/meminfo`.
    * In Windows, check the System Information.
* **4.2 System Stability Monitoring:**
    * Monitor the system for any instability or errors that may indicate configuration issues.
    * Run memory diagnostics from within the OS.
