---
title: Unlimited Power
---

## Intro 3/3
You set up your topic clearly by explaining Radio Frequency Energy Harvesting
(RFEH) and why it matters. There is a hook in the question "What if there was
another way?" that helps draw the reader in. 

## Background 3/4
You provide a fair amount of background detail on electromagnetic radiation,
radio frequencies, energy harvesting history, terminology, and underlying
physics concepts such as decibel milliamperes and free space path loss. This
helps explain the technical foundation for the reader. However, parts of the
explanations could be structured more clearly with smoother transitions between
subsections. For instance, the jump from the FSPL discussion into device
proximity trends feels abrupt in the statement "This proximity is a large part
of why this revolution is happening now as although radio has a significantly
higher operation power compared to 5G cell..." which blends too many ideas into
a single long sentence. You should ensure each technical concept is clearly
separated and logically connected to the next topic. Shorten overly long
sentences into separate statements, and maintain clear signposting phrases so
readers can follow your reasoning through the historical context and scientific
principles.

## Current Innovations 3/4
This section feel underdeveloped and over-reliant on bullets. It's hard to see
the links between background and innovation because you're not synthesizing.
Moving from innovations to prior work also feels a bit like backtracking, and
leads to confusion. It seems there needs to be better organization and
synthesis.

## Issues 2/4
We need more detail. You are looking down at the topic from a very distant
perch here. "Many tasks are there today..." So, bring us the issue. Summary is
important, but so is detail, care in description, and explanation. This section
is vague.

## Next Steps 2/3
You seem to have an outline and the elements needed in this section. But, like
the last, need the explanation and synthesis. You lay out bullets of energy
harvesting methods with no explanation to follow.

## Concultion 3/3
Your report currently lacks a fully developed conclusion section that
synthesizes the key points and reflects on the implications of Radio Frequency
Energy Harvesting in engineering. While you offer predictions, such as "I
predict that within the next 15 years, people will see more personal practical
devices ship to consumers without batteries," these statements are scattered
and not clearly framed as part of a concluding summary. Create a distinct
conclusion section that explicitly summarizes the main points discussed in your
research, reinforces the importance of your topic within the engineering field,
and presents clear future possibilities and provokes new thought.

## Style and Writing 2/3
Your writing conveys enthusiasm and curiosity, but there are grammar and
clarity issues that disrupt the academic tone expected in a research report.
Parts of your text read more like a casual article rather than a formal
research document. That juxtaposition in style can work, but right now it just
needs more attention, detail, and explanation.

## Organization 2/4
This still reads like a draft. I like the column format, but right now the
organization is a bit messy, some of the visuals are too small and hard to
read, and you have way too many bullet points. This needs more curation,
explanation, detail, and work on dual engagement.

**Powering Electronics: Radio Frequency Energy Harvesting (RFEH)**

## Intro

### Advances in Devices

Consumers are greedy. We want both smaller and simpler devices while beings as
robust as possible. Doing this is hard while managing the many complex and
inter-dependent systems within the device. As such, a reduction in this
complexity is a good place for effort to innovate.

One potential simplification is power sources. It is an incredibly complex
resource to manage in devices and laptops have entire dedicated subsystems for
it. The most common sources are batteries and wires which both place additional
restrictions. **What if there was another way?**

- Batteries are a *bad* solution in that they create many new problems. They can
be punctured, create lots of heat and pose spacial constraints on devices all
while having a large environmental impact.

- Wires have less of the obvious drawbacks compared to batteries. However, the
place the require a tether which limits the way devices can be configured.

This paper will focus on power design and how can be improved by looking at one
specific field, Radio Frequency Energy Harvesting (RFEH). RFEH places a very
very low cap on its maximum power draw of a device but otherwise could make it
able to operate indefinitely without any external connection. As such, the way
we choose to **manage the trade-offs** of reducing device functionality, thus
power needs, while maximizing utility is a challenge. The way we turn these nobs
are fundamental to the process of engineering.

### Defining Radio Frequency Energy Harvesting (RFEH)

Electromagnetic (EM) Radiation is a very common form of energy. It
has a frequency that greatly affects the way it interacts with the world:

- High frequency EM waves are X-rays that penetrate deep into objects.

- Medial frequency EM waves are light, their frequencies resulting in different colors.

- Low Frequency EM waves are microwaves, used in communication systems and, in large doses, for heat transfer.

<!-- ![Image 1: Info-graphic showing the different EM bands \[10\].](./rfeh-assets/RF Spectrum Infographic.webp) -->

Radio Frequency (RF) energy is simply just a particular frequency band of EM
radiation. RF is in radio broadcasting as well as other communication systems
like cell, wifi and bluetooth. In addition, RF waves carry energy, which can be
captured and converted into usable power to operate electronic devices. 

Energy harvesting is not new. Crystal radios, invented in the 1920s, were able
to collect both data and energy from the same signal. The goal is to go from
driving one simple circuits to powering *millions* of semiconductors in advanced
devices. 

### Terminology

Decibel milliamperes (dBm) are a unit of logarithmic power. This means that
adding 10 to the value is equivalent to a 10 fold increase in power. This can
also be negative which just means it is positive but very small. A laptop
operates are about 40dBm which means a power draw of -20dBm is one million times
less powerful.

Power, drops as the device get farther from a source, this is called free space
path loss (FSPL). This means that an increase in a source operating power is a
marginal change for how it is received. Power drops very quickly over short
distances. For example, commercial radio stations operate at 80dBm source power
but are received at around -110dBm. When we are concerned about numbers on the
order of many millions, even a doubling is not a significant change. 

<!-- ![Image 2: Graphic illustrating FSPL \[18\]](./rfeh-assets/FSPL Graphic.webp) -->

The *distance* to a source is the most important factor in determining delivered
power. The more density of devices that are emitting radio signals, the higher
your odds of being close to one are.

This proximity is a large part of why this revolution is happening now as
although radio has a significantly higher operation power compared to 5G cell,
but there are often *many* 5G cell towers placed within one city. Furthermore,
there are often wifi routers within each building.

Although tap to pay and wireless charging are both "contactless", the devices
placed as close as possible to the source. If you make your own power source you
can guarantee it will be close.

Additionally, a measure for the efficiency is Power Conversion Efficiency (PCE)
denoting how much of the potential energy around the receiver is converted to
usable power. Sources are only considered for their standard power output so we
can consider how much we expect to find in the environment.

|             | *Directed*  | *Un-Directed* |
| ----------- | :---------: | :-----------: |
| *Reactive*  | Tap to Pay  |               |
| *Proactive* | RF Switches | **RFEH**      |

*Table 1: Examples of Intersecting Terms*

In *table 1*, you can see the cross section of definitions for this paper.
Reactive technology cant be done on user request, you don't get to choose the
song on the radio. Ideally, devices are in the proactive row as it is ideal to
increase availability as devices don't have a control signal. These RFEH devices
are attempting to operate without a dedicated power source. You can't be
proactive if you need to wait for power. We instead search a well known
frequency band like cell or WiFi as discussed above to **scavenge** un-directed
power.

### Problem Statement

Normal devices operate with trillions of transistors and naive energy harvesting
can operate tens of transistors trivially. The engineering goal is to reduce the
needed load from *trillions to millions* and to increase the power draw from *tens
to millions*.

Each gain in power is important as the amount harvested effects device
efficiency \[2\]. In addition, if a more complex device can be ran on less power
that is a similar gain.

A percentage wise increase is not relevant on its on but upon compounding and
building on prior works for 100 years, these can make something great. I predict
that within the next 15 years, people will see more personal practical devices
ship to consumers **without batteries**.

## Description 

RFEH is used in devices that need frequent uptime but low interaction. A crop
sensor shouldn't have to be charged. 

### History

Crystal radios had problems with receiving too weak of a signal. **Tickler
Coil**, show ing **Image 3**, were able to amplify the received signal using feed back loops to get a
**higher voltage** out of the **same power** draw. This amplification is is
still used today in circuits as well as proving the feasibility of RF energy
harvesting. 

<!-- ![[Tickler Coil Patent.png]] -->
<!-- *Image 3: Original Patent for tickler coil \[17]* -->

This for a long time was the foremost example of RFEH. However, the modern day
building block for most innovations is RFID which is what is used in credit
cards:

- Card is placed very close to the kiosk due to FSPL.

- Payment kiosk sends a signal to the card.

- Card both collects data and energy from this signal. 

- Card sends data back to the kiosk using harvested energy.

- Kiosk uses this messaging standard in \[11] to complete the payment.

Designs vary but the method for powering the card may look like **Image 4**.

<!-- <\!-- ![[3-stage-rectifier.png]] -\-> -->
<!-- *Image 4: An example three stage rectifier presented in \[2\].* -->
  

In **Image 4** is a circuit diagram for a three stage rectifier. It
does three passes of the wave form that progressively smooth it out.

This current is used to charge a capacitor which is discharged to send back
information. Specifically, \[2] presents a new design that can build up
a full capacitor charge then fire many messages in sequence without needing to
wait for a control/power signal in-between.

### Innovation

Fundamental to understanding innovation in the field is knowing how the circuit
design process works. The innovation pipeline is very manual:

- There are thousands of possible components and nearly infinite way to arrange them. 
- As such any sort of exhaustive search is impossible.
- At small scales, device physics can become relevant and place complex physical restrictions.
- Scientists create circuits based on different theories.
- Simulations and lab results are performed on circuits to see if it produces better results.
- There are many metrics to judge on so trade-offs play a crucial role in choosing designs.

Over generations, the improvements stack up to large gains in device
performance. Circuit design benefits greatly from other research that brings in
new components to work with.

After thinking for a while, a new circuit is constructed and then simulated in
the hope that it is better. The process is tedious but in \[12] we see a model
for attempting to use AI to automate the creation of prospective circuits.

### Prior Work

Now that we understand the innovation process lets take a look at how it is used
and examples of components added to circuits. Prior work is summarized in \[3]
where each takes the base of the three stage rectifier and 

<!-- ![[table-thing.png]] -->
<!-- *Image 5: Table showing improvements \[3]* -->

Transformers are an important part of RFEH. The Tickler Coil used in the
first radios was a type of transformer. The purpose is to **boost voltage** of the
circuit while keeping power the same. There are also dc-dc boosters which as
opposed to ac-ac transformers, which have lower PCE but lower power minimums and
smaller footprints \[3].

### Power Fluctuations

Device draw and power draw both vary a lot. Devices have to respond to this and
when possible limit the problem in design.

- **Hybrid energy** sources not only can get more power but also can be more consistent
as fluctuations are less noticeable. 

- Communication systems are already subject to **packet loss** and repetition which
makes them no stranger to these partial messages. Orchestration in chaotic
environment \[9]. Minimizing power draw.

- Representative of lossy communication and inconsistencies. you need to consider
that data can sometimes not be sent if the power source drops off.

- More robust error correction software solutions are necessary.

Part of reduction in hardware demands is understanding what software we run on it.
We can optimize as the efficiency of a device dictates the caliber of software
you can run \[2].

For example, \[9\] talks about attempting to orchestrate many low power devices
in a communication network.

## Issues

  

### Trade-Offs

  

Given a specific task you want a device to perform, overtime the power needed to
perform it decreases. A line sloping down. You can also imagine that the power
we can generate increases.

  

This innovation graph of power vs years will eventually cross representing this
task being possible with RFEH. Many tasks are there today like minimal networking
but others are getting close.

  

It is possible to trade space for energy in these circuits. There is no such
thing as a too weak signal but rather only just a too small antenna. Large solar
cells solve the power but just remake the downsides of batteries.

  

Additionally, there are inherent **physical limitations** that must be
considered. Some rectennas have a saturation point beyond which they can no
longer effectively capture RF energy \[1, 2].

  

### Ethics

  

There is nothing inherently bad about this technology but there
is always the option to abuse it and raise some **ethical concerns**:

  

- **Surveillance**: Devices with no power restrictions could be installed
anywhere. Digital cameras, only requiring a short operating window, combined
with a low power motion sensor are a presently feasible use case. Walls,
clothing, or public spaces could be host to a pervasive surveillance network
without the need for maintenance. In addition, piggy backing trackers could be placed in
vehicles or belongings.

  

- **Inequity**: There is a risk that economic and social inequalities could
arise. Those without access to technology or infrastructure might be excluded
from essential services. Just as the removal of cash at stores has forced those
who do not have access to a phone or bank account to be excluded.

  

## Research / Next Steps

  

When doing more work in this field it is important to understand that it will
always be less efficient than direct connections. As such, the only benefit this
provides convenience and not efficiency. As such, any forward use cases
should be made with that in mind and if they would benefit from a
simpler method of power.

  

### Metamaterials (MTM)

  

If we want to harvest more energy then it is possible to construct a larger
antenna. In fact both solar cells and antennas do better with space and \[3]
shows that an antenna can be winded within a solar cell to save space. They do
have one restriction remaining which is that they exist in 2D. If it was
possible to create a 3D rectifier we could harvest a higher volume of energy.
Metamaterials offer a possible solution to this. 

  

MTM are a fancy name for a simple thing, which is just an object that
derives its use from its shape. Some examples are an airplane wing, a satellite
dish or sound proofing foam.

  

These topological devices can have better conversion ratios than normal
rectennas while also occupying space in 3D. Normal materials circuits have limits
on a maximum PCE but these special structures can have higher than normal PCE.
In addition, the angle any wave incidents with the device can be random
and dramatically affect the power generated, some MTMs are orientation
resistant \[15].

  

<!-- ![[mtm-substrate.png]] -->
<!-- *Image 6: MTM substrate on antenna \[15]* -->

First, in \[15] the structure showed significant loss at lower power levels:

- RF is funneled into gaps in superstrate in **Image 6** onto conventional antennas.

- Demonstrates an improvement from 0.7 mW to 6.27 mW. \[15]

- Gains lost at ambient levels (0.4 uW).

  

Secondly, the design in \[14] used a Fabry-Perot cavity design to achieve a 16 fold efficiency improvement over a frontier circuit at baseline.

- Showed some loss but still highly functional at ambient intensity \[14]

- Used Fabry-Perot cavity resonance approach which uses resonance effects to concentrate electromagnetic energy at low intensities.

- Schottky diodes to improve rectification efficiency. 

  

### Hybrid Energy Harvesting Systems

There are other energy harvesting methods:

- Photovoltaic: Energy from light

- Thermoelectric: Energy from heat difference

- Piezoelectric: Energy from physical force

One current applications of RFEH technology are **RF switches** which allow for
wireless communication and control of devices with no power consumption. They
typically act as lightswitches within a home that don't require running wires
between the switch and light. These systems are largely "install and forget"
solutions, providing low-maintenance infrastructure \[3\].

Additionally, kinetic switches use similar ideas but use piezoelectric
generators either in tandem or in place of RFEH to serve the same function. The
product is detailed in **Image 7** where the switch component is unlinked with
the battery  \[19]

<!-- ![[patent-kinetic swtich.png]] -->
<!-- *Image 7: Patent diagram of kinetic switch \[19]* -->

### Broadband

Getting only energy from only one band is inefficient and inconsistent. A
broadband antenna is made of an array of rectannas that allow it to be less
directional and harvest more frequencies \[4]. This in some cases is able to
harvest enough energy to power a Bluetooth Low Energy (BLE) beacon that operates
perpetually \[3, 4]. BLE is the same technology that powers airtags meaning that
a batteryless airtag may be viable today.

### Super Conductors

Superconductors are particular metal structures that are cooled below their
critical temperature to enter a state of no resistance. I recently attended
\[20] where the idea of superconducting diodes were introduced. With diodes it
is possible to create rectifiers which could be used for lower loss conversion
which does exist in literature \[16].

On existing parallel are dc SQUIDs which are a type of amp which needs external
power. This means it can’t be used in RFEH. Promising for detection of extremely
weak power regimes for the Internet of Things and long-distance satellite
networks \[13]. This could act as a receiver allowing the edge device to send it
at a lower power.

It has much lower power dissipation \[13] which makes it an appealing structure.
However, due to the need for a cryogenic state the energy cost of maintaining
liquid helium or nitrogen temperatures may exceed harvested energy for many
applications \[13]. However, this means it is just context dependent as if it is
already located in a quantum facility or an already cold system such as a
satellite in high orbit then it may have a use case.

## Conclusion

### Summary

Power needs will drop over time and power generation will increase over time.
The availability of ambient power sources like 5G networks and Wi-Fi has also
increased over time. Generation will exceed usage and at that time this will
become a viable technology.

Ultimately, we are not there yet but small advancements in energy conversion
efficiency, coupled with the development of lower-power chips, will pave the way
for the widespread adoption of battery-free computing. 

### Emergence

We have come so far in innovation:

- The 1920s: Brought the use of the **Tickler coil** which revolutionized radio by allowing for long distance pickups.

- The 1980s: RFid payments redefined commerce. Where able to take off due to
RFEH technology that place *NO* additional restriction on the user compared to
cash.

- The 2000s: Transistors circuits for doing analogue device logic.

- The 2020s: Metamaterials for perfect absorbers.

RFEH will soon bridge the generation usage gap and enable a
wide area of new use cases soon.

It can feel like there is little progress in each step but enough small changes
make one big one. I believe that soon, these devices will have real impact in
which people see the value in academic research.

# Bibliography

\[1\] F. A. Omara, W. A. E. Ali, A. S. Eltrass, and N. H. Abbasy, ‘Design of
2.45 GHz rectifier for low-power RF energy harvesting applications’, Microsystem
Technologies, vol. 31, no. 7, pp. 1687–1699, 2025.

\[2\] F. Lohrabi Pour, S. S. Ha, and D. S. Ha, ‘Effect of Power Conversion Efficiency of the RF Energy Harvester on the Security and Data Rate of the Self-Sustainable IoT Devices’, 2023, pp. 121–124.

\[3\] G. Moloudian et al., "RF Energy Harvesting Techniques for Battery-Less
Wireless Sensing, Industry 4.0, and Internet of Things: A Review," in IEEE
Sensors Journal, vol. 24, no. 5, pp. 5732-5745, 1 March, 2024.

\[4\] E. Kwiatkowski, J. A. Estrada, A. Lopez-Yela, and Z. Popovic, ‘Broadband
RF Energy-Harvesting Arrays’, Proc. IEEE (USA), vol. 110, no. 1, pp. 74–88, 2022.

\[5\] Q. Liu, W. IJntema, A. Drif, P. Pawelczak, and M. Zuniga, ‘BEH: Indoor
Batteryless BLE Beacons using RF Energy Harvesting for Internet of Things’.
2019.

\[6\] C. Song, Y. Huang, J. Zhou, S. Yuan, Q. Xu, and P. Carter, ‘A broadband
efficient rectenna array for wireless energy harvesting’, 2015.

\[7]: J. Lee, H. -H. Hsu, P. Davuluri, Y. Ho and J. Chen, "Impact of broadband
and out-of-band radio frequency interference (RFI) noise on WiFi performance,"
2017 IEEE International Symposium on Electromagnetic Compatibility &
Signal/Power Integrity (EMCSI), Washington, DC, USA, 2017, pp. 456-457, doi:
10.1109/ISEMC.2017.8077913. 

\[8\] E. Kwiatkowski, J. A. Estrada, A. Lopez-Yela, and Z. Popovic, ‘Broadband
RF Energy-Harvesting Arrays’, Proc. IEEE (USA), vol. 110, no. 1, pp. 74–88,
2022.

\[9\] P. A. More and Z. M. Patel, ‘Low power decentralized deferentially private
multi-armed bandit algorithm based performance improvement on long-range radio
network’, Wireless Networks, vol. 31, no. 2, pp. 1145–1162, 2025.

\[10\]: Phillips, M., Fritzsche, H. (2025, December 10). electromagnetic radiation. Encyclopedia Britannica. https://www.britannica.com/science/electromagnetic-radiation

\[11]: Luo JN, Yang MH. EMV-Compatible Offline Mobile Payment Protocol with Mutual Authentication. Sensors (Basel). 2019 Oct 23;19(21):4611. doi: 10.3390/s19214611. PMID: 31652797; PMCID: PMC6864807.

\[12]: Mina, R.; Jabbour, C.; Sakr, G.E. [A Review of Machine Learning
Techniques in Analog Integrated Circuit Design Automation](https://doi.org/10.3390/electronics11030435). _Electronics 2022_, 435.

\[13\]: Shanchi Wu, Chen Gong, Shangbin Li, Rui Ni, and Jinkang Zhu. “[Weak
Radio Frequency Signal Reception Sensitivity Based on DC Superconducting Quantum
Interference Devices](https://doi.org/10.1109/TASC.2023.3266881).” _IEEE
Transactions on Applied Superconductivity_, 2023.

\[14\]: Clayton Fowler, S. Silva, Grija Thapa, and Jiangang Zhou. “[High
Efficiency Ambient RF Energy Harvesting by a Metamaterial Perfect
Absorber](https://doi.org/10.1364/ome.449494).” _Optical Materials Express_,
2022.

\[15\]: Woosol Lee, Suk-il Choi, Hae-in Kim, S. Hwang, Saeyoung Jeon, and Y.
Yoon. “[Metamaterial-Integrated High-Gain Rectenna for RF Sensing and Energy
Harvesting Applications](https://doi.org/10.3390/s21196580).” _Italian National
Conference on Sensors_, 2021.

\[16\]: Castellani, M., Medeiros, O., Buzzi, A. et al. [A superconducting full-wave bridge rectifier](https://doi.org/10.1038/s41928-025-01376-4). _Nat Electron 8_, 417–425, 2025.

\[17]: M. Alexander, "Production of waves by cathode ray tubes," U.S. Patent 1924796A, 16 Mar., 1914.

\[18]: Wikapedia authors, File:inverse square law.svg. Wikimedia Commons. (n.d.). https://commons.wikimedia.org/wiki/File:Inverse_square_law.svg, Acessed: Dec, 3, 25

\[19]: R. Meinzer, J. Paradiso, M. Feldmeier and H. Maue, "Self-powered wireless
switch," U.S. Patent 6700310B2, 07 Sept., 2001.

\[20]: H. Yang. SCDI 1301. Class Lecture, Topic: “Engineering Coupled Quantum
Interfaces for Superconducting Quantum Technologies.” Department of Physics
and Engineering Physics, Santa Clara University, Santa Clara, CA, Dec. 2,
2025.
