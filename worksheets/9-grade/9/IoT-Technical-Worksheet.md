# IoT: Technical Worksheet

**Grade 9 · Worksheet · About 25 minutes**  
*Work with pen and paper. Use color pencils if you like. You do not need a computer or the internet.*

---

**Name:** _________________________  
**Grade/Section:** _________________________  
**Date:** _________________________

---

## How to use this worksheet

- Do the parts **in order** from top to bottom.
- Each part has a **time** so you know how long to spend.
- Read every instruction before you write. You can do this on your own.

---

## Part 1 – What you will learn (about 3 minutes)

**What you will learn:** The **Internet of Things (IoT)** is many physical objects that sense the world and share data so a larger system can react. One smart gadget is not yet a system. In this worksheet you will learn where work happens, what should stay local when a link fails, why devices need a shared way to describe data, and how to sketch a small building system without depending on a single connection.

**Do this:**

1. **Name two objects** in a school that could report data (for example a thermostat, a door, a light, or an occupancy sensor).

   - 1. _________________________  2. _________________________

2. **In one sentence**, what could a school do with those reports that it could not do with either object alone?

   _________________________________________

---

## Part 2 – One device is not a system (about 5 minutes)

An IoT **system** links sensors, a local controller, a network, and a place where people read the result, such as a **dashboard**. A single smart bulb can change color from a phone. A building system uses many readings together: which rooms are occupied, how warm they are, and which lights are on. Sending every raw reading every second can flood the network. A device can summarize locally and send a smaller update.

**Real-life scenario:** A school wants to waste less energy. Occupancy sensors, thermostats, and a dashboard are supposed to work as one system. Empty rooms should ease heating. Staff should see which wing is still in use after clubs end.

**Discuss with a partner or reflect in writing:** Why is this different from buying one smart thermostat for the office? Why might the system send “room 12 empty for 15 minutes” instead of every tiny motion?

_________________________________________
_________________________________________

**Do this:** Write **On the device**, **Local controller**, or **Dashboard** for the best place to do each job.

| Job | Best place | Why |
|-----|------------|-----|
| Detect that a person entered room 12 | _____ | _____ |
| Decide that the room has been empty long enough to ease the heat | _____ | _____ |
| Show staff which rooms were empty after 5 p.m. | _____ | _____ |
| Keep a hallway light on during a network outage | _____ | _____ |

---

## Part 3 – What must survive a broken link (about 5 minutes)

IoT systems have **dependencies**. Some actions need the network. Some should not. A **local** action uses information already in the building. A **remote** action can wait, or it fails until the link returns. Safety and basic access belong in the first group. Reports and remote adjustments can belong in the second.

**Real-life scenario:** The school’s Wi-Fi fails on a rainy afternoon. Clubs are still meeting. A vendor dashboard is offline. Interior doors, hallway lights, and room heat are the questions that matter in the next hour. A pretty energy chart can wait.

**Discuss with a partner or reflect in writing:** Which failure would you treat as urgent, and which is only inconvenient?

_________________________________________

**Do this:** Mark each function **Must work locally** or **Can wait**.

| Function | Must work locally or can wait? | Reason |
|----------|--------------------------------|--------|
| Unlock a stairwell door from the inside | _____ | _____ |
| Email yesterday’s energy report | _____ | _____ |
| Turn hallway lights on when people are present | _____ | _____ |
| Let a technician in another city change a setpoint | _____ | _____ |

---

## Part 4 – A shared description of the data (about 5 minutes)

**Interoperability** means parts from different makers can still work in one system because they describe data in a way the others understand. If a new occupancy sensor calls “empty” by a name the controller has never seen, the dashboard may show a blank room as unknown. The sensor is not broken. The system cannot interpret it. Replacing every device whenever one brand changes is expensive and wasteful.

**Critical thinking:** A school adds a cheaper sensor brand in one wing. The dashboard stops showing that wing, while the old wing looks normal. Is the first fix “buy only the original brand forever,” or is there a better requirement to put in the purchase? Write the requirement in one or two sentences.

_________________________________________
_________________________________________

**Do this:** Each row is a message from a device. Write **Clear enough to use** or **Ambiguous**. If it is ambiguous, say what is missing.

| Message | Clear enough or ambiguous? | What is missing, if anything |
|---------|----------------------------|------------------------------|
| “Room 12, occupied, 16:05” | _____ | _____ |
| “Sensor 7: 1” | _____ | _____ |
| “Wing B average 22°C, 16:00–16:15” | _____ | _____ |
| “Door open” | _____ | _____ |

---

## Part 5 – Sketch the building, then stress it (about 5 minutes)

A diagram makes dependencies visible. Include the sensors, a local controller, the network, and the dashboard. Then mark what happens if one connection is the only path.

**Do this:**

1. **Sketch** a school IoT diagram with at least four labels: sensors, local controller, network, and dashboard. Circle the one link that would cause the biggest problem if it were the only path.

```
┌─────────────────────────────────────────┐
│  (Sketch the system. Circle the weak   │
│   single link.)                         │
│                                         │
│                                         │
└─────────────────────────────────────────┘
```

2. **Write one design rule** that keeps a basic building function working when that link fails.

   _________________________________________

---

## Part 6 – Check what you learned (about 2 minutes)

**Checklist.** Put a ✓ in the box when it is true for you.

- [ ] I can explain **IoT** as many objects sharing data in a system, not as one gadget.
- [ ] I can place a job on the device, a local controller, or a dashboard.
- [ ] I can separate functions that **must work locally** from functions that can wait.
- [ ] I can say what **interoperability** requires and why a vague message is not usable.
- [ ] I can sketch a small system and name a rule that survives a broken link.

When all boxes are checked, you have reviewed the main ideas from this worksheet.

---

*Worksheet on IoT (Technical). Central topic: IoT. Main technology area: Connected systems and networks.*
