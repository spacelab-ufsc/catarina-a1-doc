.. link_budget.rst

    Copyright The Catarina-A1 Contributors.

    Catarina-A1 Documentation

    This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
    International License. To view a copy of this license,
    visit http://creativecommons.org/licenses/by-sa/4.0/.

.. _anx:link-budget:

***********************
Link Budget Calculation
***********************

This appendix shows the link budget calculation of all the satellite links (including the radio links of the payloads). The method used was taken from :cite:`larson2005` (section 13.3).

Distance to Satellite at Horizon
================================

The distance to the satellite at the horizon (the maximum theoretical distance between the satellite and a ground station) can be calculated using Equatio :eq:`eq:horizon-distance`.

.. math::
    :label: eq:horizon-distance

    d = \sqrt{2\cdot R_{e}\cdot h + h^{2}}

Where:

* :math:`R_{e}` = Earth radius = 6378 km
* :math:`h` = Satellite altitude = 500 km
* :math:`d` = Distance to the satellite at the horizon

So, the distance to the satellite at the horizon is:

.. math::
    :label: eq:horizon-distance-result

    d = \sqrt{2\cdot 6378\cdot 500 + 500^{2}} \cong \mathbf{2574\ km}

Free-Space Path Loss
====================

The free-space path loss (:math:`FSPL`) can be calculated using Equation :eq:`eq:fspl`.

.. math::
    :label: eq:fspl

    FSPL = \left( \frac{4\pi d f}{c} \right)^{2}

Where:

* :math:`d` = Distance between the satellite and the ground station
* :math:`f` = Radiofrequency
* :math:`c` = Speed of light

The FSPL value in decibels can be calculated with Equation :eq:`eq:fsbl-db`.

.. math::
    :label: eq:fsbl-db

    \begin{split}
        FSPL^{dB} & = 20\log\left(\frac{4\pi}{c}\right) + 20\log\left(d\right) + 20\log\left(f\right) \\
                  & = 32,45 + 20\log\left(\frac{d}{1\ km}\right) + 20\log\left(\frac{f}{1\ MHz}\right) \\
    \end{split}

The minimum distance between the satellite and a ground station is the satellite altitude, in this case: 500 km. The maximum distance is the distance at the horizon, defined by Equation :eq:`eq:horizon-distance-result`.

Downlink
********

Considering the frequency of the downlink as 468 MHz, the minimum and maximum FSBL is:

.. math::

    FSPL^{dB}_{min} = 32,45 + 20\log\left(\frac{500}{1\ km}\right) + 20\log\left(\frac{468}{1\ MHz}\right) = \mathbf{139,8\ dB}

.. math::

    FSPL^{dB}_{max} = 32,45 + 20\log\left(\frac{2574}{1\ km}\right) + 20\log\left(\frac{468}{1\ MHz}\right) = \mathbf{154,1\ dB}

.. math::

    \mathbf{139,8 \leq FSPL^{dB} \leq 154,1\ dB}

Uplink
******

Considering the frequency of the uplink as 401 MHz, the minimum and maximum FSBL is:

.. math::

    FSPL^{dB}_{min} = 32,45 + 20\log\left(\frac{500}{1\ km}\right) + 20\log\left(\frac{401}{1\ MHz}\right) = \mathbf{138,5\ dB}

.. math::

    FSPL^{dB}_{max} = 32,45 + 20\log\left(\frac{2574}{1\ km}\right) + 20\log\left(\frac{401}{1\ MHz}\right) = \mathbf{152,7\ dB}

.. math::

    \mathbf{138,5 \leq FSPL^{dB} \leq 152,7\ dB}

Uplink (Payload)
****************

Considering the frequency of the main payload's uplink is 401,635 MHz, the minimum and maximum FSBL is:

.. math::

    FSPL^{dB}_{min} = 32,45 + 20\log\left(\frac{500}{1\ km}\right) + 20\log\left(\frac{401,635}{1\ MHz}\right) = \mathbf{138,5\ dB}

.. math::

    FSPL^{dB}_{max} = 32,45 + 20\log\left(\frac{2574}{1\ km}\right) + 20\log\left(\frac{401,635}{1\ MHz}\right) = \mathbf{152,7\ dB}

.. math::

    \mathbf{138,5 \leq FSPL^{dB} \leq 152,7\ dB}

Power at Receiver
=================

The power of the signal at the receiver can be estimated using Equation :eq:`eq:power-at-receiver`.

.. math::
    :label: eq:power-at-receiver

    P_{r} = P_{t} + G_{t} + G_{r} - L_{p} - L_{s}

Where:

* :math:`P_{r}` = Power at the receiver
* :math:`P_{t}` = Transmitter power
* :math:`G_{t}` = Antenna gain of the transmitter
* :math:`G_{r}` = Antenna gain of the receiver
* :math:`L_{p}` = FSPL (Free-Space Path Loss)
* :math:`L_{s}` = Other losses in the system

Considering the worst scenario with the maximum possible distance between the satellite and a ground station, the power at the receiver for each link is calculated below.

Downlink
********

.. math::

    P_{r} = 30 + 0 + 12 - 154,1 - 5 = -117,1\ dBm

.. math::

    \mathbf{P_{r} \geq -117,1\ dBm}

Uplink
******

.. math::

    P_{r} = 44 + 12 + 0 - 152,7 - 5 = -101,7\ dBm

.. math::

    \mathbf{P_{r} \geq -101,7\ dBm}

Uplink (Payload)
****************

.. math::

    P_{r} = 30 + 3 + 0 - 152,7 - 5 = -124,7\ dBm

.. math::

    \mathbf{P_{r} \geq -124,7\ dBm}

Signal-to-Noise-Ratio
=====================

The Signal-to-Noise-Ratio (SNR) of a transmitted signal at the receiver can be expressed using Equation :eq:`eq:snr`:

.. math::
    :label: eq:snr

    SNR = \frac{E_{b}}{N_{0}} = \frac{P_{t}G_{t}G_{r}}{kT_{s}RL_{p}}

Where:

* :math:`P_{t}` = Transmitter power
* :math:`G_{t}` = Antenna gain of the transmitter
* :math:`G_{r}` = Receiver gain
* :math:`k` = Boltzmann's constant (:math:`\cong 1,3806 \times 10^{-23}\ J/K`)
* :math:`T_{s}` = System noise temperature
* :math:`R` = Data rate in bits per second (bps)
* :math:`L_{p}` = Free-Space Path Loss (FSPL)

The system noise temperature (:math:`T_{s}`) can be defined using Equation :eq:`eq:system-noise-temperature`.

.. math::
    :label: eq:system-noise-temperature

    T_{s} = T_{ant} + T_{r}

with:

.. math::
    :label: eq:noise-temperature-receiver

    T_{r} = \frac{T_{0}}{L_{r}} (F - L_{r})

and:

.. math::
    :label: eq:noise-figure

    F = 1 + \frac{T_{r}}{T_{0}}

Combining Equations :eq:`eq:system-noise-temperature`, :eq:`eq:noise-temperature-receiver` and :eq:`eq:noise-figure`:

.. math::
    :label: eq:system-noise-temp-expanded

    T_{s} = T_{ant} + \left( \frac{T_{0}(1 - L_{r})}{L_{r}} \right) + \left( \frac{T_{0} (F - 1)}{L_{r}} \right)

Where:

* :math:`T_{ant}` = Antenna noise temperature
* :math:`T_{0}` = Reference temperature (usually 290 K)
* :math:`L_{r}` = Line loss between the antenna and the receiver
* :math:`F` = Noise figure of the receiver
* :math:`T_{r}` = Noise temperature of the receiver

The SNR value in decibels can be calculated using the Equation :eq:`eq:snr-db`:

.. math::
    :label: eq:snr-db

    \begin{split}
        SNR^{dB} & = 10\log_{10}\left( \frac{E_{b}}{N_{0}} \right) = 10\log_{10} \left( \frac{P_{t}G_{t}G_{r}}{kT_{s}RL_{p}} \right) \\
                 & = P_{t}^{dBm} - 30 + G_{t}^{dB} + G_{r}^{dB} - L_{p}^{dB} - 10\log k - 10\log T_{s} - 10\log R
    \end{split}

Considering other losses in the system (:math:`L_{s}`) (cable and connection losses as an example), the Equation :eq:`eq:snr-db` can be corrected as presented in Equation :eq:`eq:snr-db-with-losses`.

.. math::
    :label: eq:snr-db-with-losses

    SNR^{dB} = P_{t}^{dBm} - 30 + G_{t}^{dB} + G_{r}^{dB} - L_{p}^{dB} - L_{s}^{dB} - 10\log k - 10\log T_{s} - 10\log R

Downlink
********

Using Equations :eq:`eq:snr-db-with-losses` and :eq:`eq:system-noise-temperature`, with:

* :math:`P_{t} = 30\ dBm`
* :math:`G_{t} = 0\ dBi`
* :math:`G_{r} = 12\ dBi`
* :math:`L_{p} = 154,1\ dB`
* :math:`L_{s} = 5\ dB`
* :math:`R = 4800\ bps`
* :math:`T_{0} = 290\ K`
* :math:`T_{r} = 290\ K`
* :math:`T_{ant} = 300\ K`
* :math:`F = 2\ dB`
* :math:`L_{r} = 0,89\ (0,5\ dB)`

.. math::

    SNR^{dB} = 30 - 30 + 0 + 12 - 154,1 - 5 + 228,6 - 28,21 - 36,81 = 16,48\ dB

.. math::

    \mathbf{SNR^{dB} \geq 16,48\ dB}

Uplink
******

Using Equations :eq:`eq:snr-db-with-losses` and :eq:`eq:system-noise-temperature`, with:

* :math:`P_{t} = 44\ dBm`
* :math:`G_{t} = 12\ dBi`
* :math:`G_{r} = 0\ dBi`
* :math:`L_{p} = 152,7\ dB`
* :math:`L_{s} = 5\ dB`
* :math:`R = 4800\ bps`
* :math:`T_{0} = 290\ K`
* :math:`T_{r} = 290\ K`
* :math:`T_{ant} = 300\ K`
* :math:`F = 2\ dB`
* :math:`L_{r} = 0,89\ (0,5\ dB)`

.. math::

    SNR^{dB} = 44 - 30 + 12 + 0 - 152,7 - 5 + 228,6 - 28,21 - 36,81 = 31,88\ dB

.. math::

    \mathbf{SNR^{dB} \geq 31,88\ dB}

Uplink (Payload)
****************

Using Equations :eq:`eq:snr-db-with-losses` and :eq:`eq:system-noise-temperature`, with:

* :math:`P_{t} = 30\ dBm`
* :math:`G_{t} = 3\ dBi`
* :math:`G_{r} = 0\ dBi`
* :math:`L_{p} = 152,7\ dB`
* :math:`L_{s} = 5\ dB`
* :math:`R = 400\ bps`
* :math:`T_{0} = 290\ K`
* :math:`T_{r} = 290\ K`
* :math:`T_{ant} = 300\ K`
* :math:`F = 2\ dB`
* :math:`L_{r} = 0,89\ (0,5\ dB)`

.. math::

    SNR^{dB} = 30 - 30 + 3 + 0 - 152,7 - 5 + 228,6 - 28,21 - 26,02 = 19,67\ dB

.. math::

    \mathbf{SNR^{dB} \geq 19,67\ dB}

Link Margin
===========

From :cite:`larson2005`, the minimum SNR value at the received considering a :math:`10^{-5}` bit error rate is:

* Downlink: :math:`SNR^{dB} \geq 9,6\ dB`
* Uplink: :math:`SNR^{dB} \geq 9,6\ dB`
* Uplink (payload): :math:`SNR^{dB} \geq 9,6\ dB`

And considering the link margin as the SNR of the link minus the SNR threshold for a given bit error, the link margin of the radio links of the satellite are:

* Downlink: :math:`16,48 - 9,6 = \mathbf{6,88\ dB}`
* Uplink: :math:`31,88 - 9,6 = \mathbf{22,28\ dB}`
* Uplink (payload): :math:`19,67 - 9,6 = \mathbf{10,07\ dB}`
