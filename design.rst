.. design.rst

    Copyright The Catarina-A1 Contributors.

    Catarina-A1 Documentation

    This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
    International License. To view a copy of this license,
    visit http://creativecommons.org/licenses/by-sa/4.0/.

.. _ch:design:

***********************
Service Module Overview
***********************

This chapter presents the service module that will be used in Catarina-A1. The aim is to show the positioning of the boards in the 2U CubeSat, as well as the communication and power interfaces related to the satellite's service module.

General Diagrams
================

The subsystems of the CubeSat are arranged within the 2U-based physical structure, as illustrated in :numref:`fig:subsystems-positioning`.

.. figure:: figures/General_display_diagram_Catarina-A1.*
   :name: fig:subsystems-positioning
   :width: 100%
   :align: center
   :alt: Subsystems positioning in the CubeSat.

   Subsystems positioning.

Power Diagram
-------------

The block diagram depicted in :numref:`fig:power-diagram` provides an overview of the satellite's power distribution system. In particular, several :term:`EPS` output converters, with the exception of those dedicated to powering the service module subsystems, can be deactivated via EN pins. The :term:`OBDH` is in charge of this control, activating or deactivating certain subsystems and/or payloads.

It is crucial to emphasize that the bus designated for the antenna module remains active solely during its deployment phase. In addition, the current values presented in the diagram represent the maximum capacity rather than the nominal operating values. Actual operational values depend upon the variable power output of the solar panels and the varying loads experienced during the satellite's mission.

.. figure:: figures/power_diagram.*
   :name: fig:power-diagram
   :width: 100%
   :align: center
   :alt: Satellite power distribution diagram.

   Power diagram.

Data Path Diagram
-----------------

The data path diagram is shown in :numref:`fig:data-path`.

.. figure:: figures/data-path-diagram.*
   :name: fig:data-path
   :width: 100%
   :align: center
   :alt: Satellite data path diagram.

   Data path diagram.

Deployment Sequence
-------------------

The deployment sequence of the satellite is the routine to be executed just after the launch. The main objective of this operation is to deploy the antennas and prepare the satellite to start its normal operation.

After the satellite is ejected from the deployer, the kill switches enable the electric power and the three core modules to execute the boot sequence (:term:`EPS`, :term:`OBDH` and :term:`TTC`). The :term:`EPS` module is ready to operate when the boot finishes. The :term:`OBDH` and the :term:`TTC` modules wait for a determined period before starting normal execution.

As the :term:`OBDH` and the :term:`TTC` have access to the antenna module, both subsystems can control the deployment of the antennas. Following the CDS specifications :cite:`cds`, all CubeSats must wait 30 minutes to deploy the antennas and 45 minutes to transmit any RF signal. This way, the :term:`OBDH` waits 45 minutes to send the deployment command to the antenna module. As redundancy, the :term:`TTC` waits 55 minutes to execute the same operation.

:numref:`fig:deployment-flowchart` illustrates the deployment sequence of the service modules.

.. figure:: figures/deployment-flowchart.*
   :name: fig:deployment-flowchart
   :width: 50%
   :align: center
   :alt: Flowchart of the deployment sequence.

   Flowchart of the deployment sequence.

Beacon Operation
----------------

After the beacon microcontroller's boot sequence, the beacon's operation starts. The normal operation consists of reading the data from the :term:`EPS` and the :term:`TTC` modules, transmitting the valid data (:term:`EPS` or :term:`TTC` packet, in this order of priority), waiting 60 seconds, and repeating this sequence. :numref:`fig:beacon-flowchart` shows this behavior.

.. figure:: figures/beacon-flowchart.*
   :name: fig:beacon-flowchart
   :width: 55%
   :align: center
   :alt: Flowchart of normal beacon operation.

   Flowchart of the normal beacon operation.

OBDH Operation
--------------

After the boot sequence of the :term:`OBDH` microcontroller, the operation of the :term:`OBDH` starts. The regular operation consists of reading the housekeeping data from the :term:`EPS`, :term:`TTC`, payloads, antenna module, and the :term:`OBDH` (its own housekeeping data), saving the read data on non-volatile memory, and transmitting the housekeeping data of the satellite as a beacon. After that, it waits 60 seconds and checks if a new telecommand was received; if true, it processes the telecommand; if not, it does nothing. After this sequence, these steps start again. :numref:`fig:obdh-flowchart` shows this behavior.

.. figure:: figures/obdh-flowchart.*
   :name: fig:obdh-flowchart
   :width: 63%
   :align: center
   :alt: Flowchart of normal OBDH operation.

   Flowchart of the normal :term:`OBDH` operation.

Telecommand Processing
~~~~~~~~~~~~~~~~~~~~~~

:numref:`fig:tc-flowchart` shows the telecommand processing flow.

.. figure:: figures/tc-flowchart.*
   :name: fig:tc-flowchart
   :width: 100%
   :align: center
   :alt: Flowchart of telecommand processing.

   Flowchart of telecommand processing.

EPS Operation
-------------

The operation of the :term:`EPS` microcontroller starts shortly after the release of the CubeSat in its orbit by the deployer. In the first 60 minutes, the module operation consists of reading the housekeeping data from its sensors and managing the duty cycles of the MPPT and heaters. When operational, the :term:`TTC` and :term:`OBDH` modules send separate periodic requests to the :term:`EPS` for forwarding the housekeeping data acquired. The :term:`TTC` receives a simplified version, while the :term:`OBDH` receives a complete version of the data. :numref:`fig:eps-flowchart` shows this behavior.

.. figure:: figures/eps_flowchart.*
   :name: fig:eps-flowchart
   :width: 45%
   :align: center
   :alt: Flowchart of normal EPS operation.

   Flowchart of the normal :term:`EPS` operation.

Interface Datasheet (IDS)
=========================

Interface
---------

To electrically connect all the satellite modules, a PC-104 bus standard is being used. This bus is composed of 104 lines disposed by four rows of 26 pins each, with a vertical and horizontal pitch of 2.54 mm.

Using :numref:`fig:pc104-ref-diagram` as reference, all used positions and signals of the PC-104 bus are presented in :numref:`tab:pc104-pinout`. :numref:`tab:pc104-signals` describes each signal and the modules connected to them.

.. figure:: figures/pc104-diagram.*
   :name: fig:pc104-ref-diagram
   :width: 50%
   :align: center
   :alt: PC-104 bus reference diagram.

   Reference diagram of the PC-104 bus (top view of a generic module).

.. list-table:: PC-104 bus pinout.
   :name: tab:pc104-pinout
   :header-rows: 1
   :widths: 12 22 22 22 22
   :align: center

   * - **Pin Row**
     - **H1 Odd**
     - **H1 Even**
     - **H2 Odd**
     - **H2 Even**
   * - 1-2
     - -
     - -
     - -
     - -
   * - 3-4
     - -
     - -
     - EDC_EN
     - EPL_EN
   * - 5-6
     - -
     - -
     - BE_UART_RX
     - -
   * - 7-8
     - RA_GPIO_0
     - RA_GPIO_1
     - BE_UART_TX
     - GPIO_0
   * - 9-10
     - RA_GPIO_2
     - BE_EN
     - -
     - -
   * - 11-12
     - RA_RESET
     - RA_EN
     - BE_SPI_MOSI
     - BE_SPI_CLK
   * - 13-14
     - -
     - -
     - BE_SPI_CS
     - BE_SPI_MISO
   * - 15-16
     - -
     - -
     - -
     - -
   * - 17-18
     - EPL_UART_RX/TX
     - GPIO_6
     - -
     - GPIO_1
   * - 19-20
     - EPL_UART_TX/RX
     - GPIO_2
     - -
     - GPIO_3
   * - 21-22
     - -
     - -
     - -
     - GPIO_4
   * - 23-24
     - -
     - -
     - -
     - -
   * - 25-26
     - -
     - -
     - PL_VCC
     - PL_VCC
   * - 27-28
     - -
     - -
     - TTC_VCC
     - TTC_VCC
   * - 29-30
     - GND
     - GND
     - GND
     - GND
   * - 31-32
     - GND
     - GND
     - GND
     - GND
   * - 33-34
     - -
     - -
     - -
     - -
   * - 35-36
     - RA_SPI_CLK
     - -
     - ANT_VCC
     - ANT_VCC
   * - 37-38
     - RA_SPI_MISO
     - -
     - -
     - -
   * - 39-40
     - RA_SPI_MOSI
     - RA_SPI_CS
     - -
     - -
   * - 41-42
     - EDC_I2C_SDA
     - -
     - -
     - GPIO_5
   * - 43-44
     - EDC_I2C_SCL
     - -
     - -
     - -
   * - 45-46
     - OBDH_VCC
     - OBDH_VCC
     - BAT_VCC
     - BAT_VCC
   * - 47-48
     - PL_VCC
     - PL_VCC
     - -
     - -
   * - 49-50
     - RA_VCC
     - RA_VCC
     - EPS_I2C_SDA
     - -
   * - 51-52
     - BE_VCC
     - BE_VCC
     - EPS_I2C_SCL
     - -

.. list-table:: PC-104 bus signal description.
   :name: tab:pc104-signals
   :header-rows: 1
   :widths: 18 20 24 38
   :align: center

   * - **Signal**
     - **Pin(s)**
     - **Used By**
     - **Description**
   * - GND
     - H1-29/30/31/32, H2-29/30/31/32
     - All
     - Ground reference
   * - BAT_VCC
     - H2-45, H2-46
     - :term:`EPS`
     - Battery terminals (+)
   * - ANT_VCC
     - H2-35, H2-36
     - :term:`EPS`, ANT
     - Antennas power supply (3.3 V)
   * - OBDH_VCC
     - H1-45, H1-46
     - :term:`EPS`, :term:`OBDH`
     - :term:`OBDH` power supply (3.3 V)
   * - TTC_VCC
     - H2-27, H2-28
     - :term:`EPS`, :term:`TTC`
     - :term:`TTC` power supply (3.3 V)
   * - PL_VCC
     - H1-47/48, H2-25/26
     - :term:`EPS`, :term:`EDC`, ExpLoRa
     - Payloads power supply (5 V)
   * - RA_VCC
     - H1-49, H1-50
     - :term:`EPS`, :term:`TTC`
     - Main radio power supply (5 V)
   * - BE_VCC
     - H1-51, H1-52
     - :term:`EPS`, :term:`TTC`
     - Beacon power supply (6 V)
   * - RA_SPI_CLK
     - H1-35
     - :term:`OBDH`, :term:`TTC`
     - CLK signal of the main radio SPI bus
   * - RA_SPI_MISO
     - H1-37
     - :term:`OBDH`, :term:`TTC`
     - MISO signal of the main radio SPI bus
   * - RA_SPI_MOSI
     - H1-39
     - :term:`OBDH`, :term:`TTC`
     - MOSI signal of the main radio SPI bus
   * - RA_SPI_CS
     - H1-40
     - :term:`OBDH`, :term:`TTC`
     - CS signal of the main radio SPI bus
   * - EPS_I2C_SDA
     - H2-49
     - :term:`OBDH`, :term:`EPS`
     - SDA signal of the :term:`EPS` I2C bus
   * - EPS_I2C_SCL
     - H2-51
     - :term:`OBDH`, :term:`EPS`
     - SCL signal of the :term:`EPS` I2C bus
   * - BE_UART_RX
     - H2-5
     - :term:`EPS`, :term:`TTC`
     - :term:`EPS` TX, Beacon RX (UART bus)
   * - BE_UART_TX
     - H2-7
     - :term:`EPS`, :term:`TTC`
     - :term:`EPS` RX, Beacon TX (UART bus)
   * - EPL_UART_TX/RX
     - H1-25
     - :term:`OBDH`, ExpLoRa
     - :term:`OBDH` TX, ExpLoRa RX (UART bus)
   * - EPL_UART_RX/TX
     - H1-27
     - :term:`OBDH`, ExpLoRa
     - :term:`OBDH` RX, ExpLoRa TX (UART bus)
   * - BE_EN
     - H1-10
     - :term:`EPS`, :term:`TTC`
     - Beacon radio power enable
   * - RA_EN
     - H1-12
     - :term:`EPS`, :term:`OBDH`
     - Main radio power enable
   * - EDC_EN
     - H2-3
     - :term:`OBDH`, :term:`EDC`
     - :term:`EDC` enable signal
   * - EPL_EN
     - H2-4
     - :term:`OBDH`, ExpLoRa
     - ExpLoRa enable signal
   * - EDC_I2C_SDA
     - H1-41
     - :term:`OBDH`, :term:`EDC`
     - SDA signal of the payload I2C bus
   * - EDC_I2C_SCL
     - H1-43
     - :term:`OBDH`, :term:`EDC`
     - SCL signal of the payload I2C bus
   * - GPIO_N
     - H1-20, H2-8/18/20/22/42
     - :term:`OBDH`
     - GPIO pin (not used)

This project's distribution pattern of pins is a mix of multiple patterns from CubeSat module manufacturers, such as GomSpace, ISIS, and Endurosat. Some pins are positioned to meet specific project requirements, and the adopted pattern may only be partially compatible with some commercial modules.

Beyond the PC-104 bus, some signals are connected directly by wires and cables, such as the control and power pins of the antenna module, the battery charger, and the programming ports.

Form Factor
-----------

The form factor follows a similar specification to the PC-104 standard :cite:`pc104-specification`. The connector used for the interface differs by module; the isolation height and presence of a pin or receptacle are defined from the overall stack-up of the subsystems inside the CubeSat 2U structure. The core modules have smoothed edges, and some linear mounting-hole distances differ from the standard in order to fit a CubeSat form factor. The PC-104 form factor used can be seen in :numref:`fig:pc104-form-factor`.

.. figure:: figures/pc104-form-factor.*
   :name: fig:pc104-form-factor
   :width: 75%
   :align: center
   :alt: PC-104 form factor.

   PC-104 form factor.

Telecommunication
=================

This section describes the configuration and behavior of the telecommunication subsystems of the satellite. There are three types of links available in the CubeSat: beacon, downlink, and uplink. The beacon link is a periodic transmission of packets with basic telemetry data of the satellite (containing data from the :term:`EPS` or :term:`TTC` subsystems). The downlink is used to receive all data from the satellite, including the results of all experiments, telemetry data, and telecommand feedback. Moreover, the uplink sends telecommands from a ground station to the satellite.

The payload of all packets follows the same structure, with an :term:`ID` number, the source address (callsign), and the packet's content (variable according to each type of packet). Following the NGHam protocol characteristics, the maximum packet length, including the :term:`ID` and the source address, is 220 bytes. :numref:`fig:fsat-pkt-structure` illustrates this packet structure.

.. figure:: figures/floripasat-packet-structure.*
   :name: fig:fsat-pkt-structure
   :width: 50%
   :align: center
   :alt: Catarina-A1 packet payload structure.

   Payload structure of the Catarina-A1 packets.

:numref:`tab:packets-struct` summarizes all types of packets transmitted or received by the satellite, with the :term:`ID` number, structure and length, and access type of each packet.

.. list-table:: Telecommunication packets and their content.
   :name: tab:packets-struct
   :header-rows: 1
   :widths: 11 18 8 20 31 12
   :align: center

   * - **Link**
     - **Packet Name**
     - **ID**
     - **Source Callsign**
     - **Data (up to 220 bytes)**
     - **Size / Access**
   * - Beacon
     - :term:`EPS` data
     - 00h
     - ``"" + "PY0EFS"``
     - :term:`EPS` data
     - 46 / Public
   * - Beacon
     - :term:`TTC` data
     - 01h
     - ``"" + "PY0EFS"``
     - :term:`TTC` data
     - 19 / Public
   * - Downlink
     - General telemetry
     - 20h
     - ``"" + "PY0EFS"``
     - :term:`OBDH`/:term:`EPS` data
     - 78 / Public
   * - Downlink
     - Ping answer
     - 21h
     - ``"" + "PY0EFS"``
     - Requester callsign
     - 15 / Public
   * - Downlink
     - Data request answer
     - 22h
     - ``"" + "PY0EFS"``
     - Requester callsign + data ID + timestamp + data
     - 20 to 220 / Public
   * - Downlink
     - Message broadcast
     - 23h
     - ``"" + "PY0EFS"``
     - Requester + destination callsign + message
     - 22 to 60 / Public
   * - Downlink
     - Payload data
     - 24h
     - ``"" + "PY0EFS"``
     - Payload ID + payload data
     - 9 to 220 / Public
   * - Downlink
     - TC feedback
     - 25h
     - ``"" + "PY0EFS"``
     - Requester callsign + TC packet ID + timestamp
     - 20 / Public
   * - Downlink
     - Parameter value
     - 26h
     - ``"" + "PY0EFS"``
     - Requester callsign + subsystem ID + parameter ID + parameter value
     - 21 / Public
   * - Uplink
     - Ping request
     - 40h
     - Any callsign
     - None
     - 8 / Public
   * - Uplink
     - Data request
     - 41h
     - Any callsign
     - Data ID + start timestamp + end timestamp + hash
     - 37 / Private
   * - Uplink
     - Broadcast message
     - 42h
     - Any callsign
     - Destination callsign + message
     - 15 to 53 / Public
   * - Uplink
     - Enter hibernation
     - 43h
     - Any callsign
     - Hibernation in hours + hash
     - 30 / Private
   * - Uplink
     - Leave hibernation
     - 44h
     - Any callsign
     - Hash
     - 28 / Private
   * - Uplink
     - Activate module
     - 45h
     - Any callsign
     - Module ID + hash
     - 29 / Private
   * - Uplink
     - Deactivate module
     - 46h
     - Any callsign
     - Module ID + hash
     - 29 / Private
   * - Uplink
     - Activate payload
     - 47h
     - Any callsign
     - Payload ID + hash
     - 29 / Private
   * - Uplink
     - Deactivate payload
     - 48h
     - Any callsign
     - Payload ID + hash
     - 29 / Private
   * - Uplink
     - Erase memory
     - 49h
     - Any callsign
     - Hash
     - 28 / Private
   * - Uplink
     - Force reset
     - 4Ah
     - Any callsign
     - Hash
     - 28 / Private
   * - Uplink
     - Get payload data
     - 4Bh
     - Any callsign
     - Payload ID + arguments + hash
     - 41 / Private
   * - Uplink
     - Set parameter
     - 4Ch
     - Any callsign
     - Subsystem ID + parameter ID + parameter value + hash
     - 34 / Private
   * - Uplink
     - Get parameter
     - 4Dh
     - Any callsign
     - Subsystem ID + parameter ID + hash
     - 30 / Private

The IDs of the subsystems, modules, and payloads are available in :numref:`tab:system-ids`.

.. list-table:: IDs of the satellite.
   :name: tab:system-ids
   :header-rows: 1
   :widths: 25 25 50
   :align: center

   * - **Type**
     - **ID Number**
     - **Description**
   * - Subsystem
     - 0
     - :term:`OBDH`
   * - Subsystem
     - 1
     - :term:`TTC` 1
   * - Subsystem
     - 2
     - :term:`TTC` 2
   * - Subsystem
     - 3
     - :term:`EPS`
   * - Module
     - 1
     - Battery heater
   * - Module
     - 2
     - Beacon
   * - Module
     - 3
     - Periodic telemetry
   * - Payload
     - 1
     - :term:`EDC`
   * - Payload
     - 2
     - ExpLoRa

Authentication
--------------

All telecommands classified as private use an HMAC authentication scheme. Every type of private telecommand has a unique 16-digit ASCII character key that, together with the telecommand sequence (or message), generates a 160-bit (20-byte) hash sequence to be transmitted with the packet payload. The hash algorithm used is SHA-1. :numref:`fig:hmac-diagram` illustrates this authentication method.

.. figure:: figures/hmac-diagram.*
   :name: fig:hmac-diagram
   :width: 100%
   :align: center
   :alt: Diagram of the HMAC scheme.

   Diagram of the used HMAC scheme.

Operation Licenses
------------------

Regarding non-amateur radio frequencies, Resolution 685, of October 9, 2017, from ANATEL establishes the following.

Art. 9. Assign to the Private Limited Service (SLP), for use by systems for capturing and transmitting scientific data related to space operation, on a secondary basis, the following sub-ranges related to this project:

* 400.15 to 401 MHz;
* 401 to 403 MHz;
* 468 to 469 MHz.

Art. 17. The allocation of all radio frequency bands dealt with in this Resolution follows the restrictions imposed by the respective allocation.

Single paragraph. Those interested in the use of the radio frequency bands object of this Resolution must provide in their projects, until specific regulations are issued on the conditions of use of these bands, criteria for harmonious coexistence with the existing systems in these bands, maintaining specific coordination, when necessary, so that incoming systems do not cause harmful interference to existing systems.
