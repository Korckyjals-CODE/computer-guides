# System Resilience: Technical Worksheet

**Grade 12 · Worksheet · About 25 minutes**  
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

**What you will learn:** **System resilience** is the ability of a system to keep delivering essential functions during stress—and to recover quickly after disruption. You will connect resilience to **redundancy**, **backups**, **failover**, monitoring, and recovery objectives (RTO/RPO concepts at a high level).

**Do this:**

1. **In one sentence**, what does resilience mean beyond “never fails”?

   _________________________

2. **Name one system** (school, city, or personal) that must keep working under stress.

   _________________________

---

## Part 2 – Resilience vs mere uptime (about 5 minutes)

**Uptime** measures how often a system is available. **Resilience** asks what happens when parts fail.

**Real-life scenario:** A school stores all attendance, grades, and lesson materials on a single server with no tested backup. The server has been “up” for 18 months. One disk failure takes everything offline for a week.

**Discuss with a partner or reflect in writing:** Why was long uptime not the same as resilience here?

_________________________________________

**Do this:** Label each property as supporting **Uptime focus** or **Resilience focus** (best fit).

| Property | Focus |
|----------|-------|
| Percentage of hours the portal was reachable last year | _____ |
| Documented failover to a secondary site within 2 hours | _____ |
| Regular restore tests from backup | _____ |
| “We have never had an outage, so we skip drills” | _____ |

---

## Part 3 – Redundancy, backups, and failover (about 5 minutes)

**Redundancy** means extra capacity or alternate paths. A **backup** is a copy of data stored separately. **Failover** is switching to a standby when the primary fails.

**Real-life scenario:** IT keeps nightly backups on the same rack as the production server. A room fire destroys both. Another school keeps offline and off-site copies and practices restoring a sample folder each quarter.

**Critical thinking:** Which school is more resilient, and which single design choice mattered most?

_________________________________________

**Do this:** Match each control to its primary role.

**Word bank:** *Redundancy* · *Backup* · *Failover* · *Monitoring*

| Control | Role |
|---------|------|
| Second internet link that activates if the first dies | _____ |
| Encrypted copy of databases stored off-site | _____ |
| Alerts when disk errors rise above a threshold | _____ |
| Automatic switch from primary app server to standby | _____ |

---

## Part 4 – Recovery objectives and single points of failure (about 5 minutes)

A **single point of failure (SPOF)** is one component whose loss stops the whole service. **RTO** is how quickly you need to be back; **RPO** is how much data loss you can tolerate.

**Real-life scenario:** An online exam platform can lose at most 5 minutes of answers (tight RPO) and must reopen within 30 minutes (RTO).

**Do this:**

1. **Circle** the SPOF in this setup: One authentication server · Two mirrored databases · Dual power feeds

2. **For a school grading portal the night before report cards**, propose a rough RTO and RPO in plain language.

   RTO idea: _________________________
   RPO idea: _________________________

3. **Explain** one trade-off: stronger resilience often costs more money or complexity. Give one example.

   _________________________

---

## Part 5 – Resilience architecture sketch (about 5 minutes)

**Do this:**

1. **Sketch a resilient mini-architecture** for one critical school service. Include at least: primary, backup/redundancy, monitoring, and a recovery note.

```
(Your sketch)
```

2. **Star the SPOF** you removed (or still worry about) and say why.

   _________________________

---

## Part 6 – Check what you learned (about 2 minutes)

**Checklist.** Put a ✓ in the box when it is true for you.

- [ ] I can distinguish **uptime** from **resilience**.
- [ ] I can explain **redundancy**, **backup**, **failover**, and **monitoring**.
- [ ] I can identify a **single point of failure**.
- [ ] I can discuss **RTO/RPO** ideas in plain language.
- [ ] I can sketch a simple resilient design with recovery in mind.

When all boxes are checked, you have reviewed the main ideas from this worksheet.

---

*Worksheet on System Resilience (Technical). Central topic: System resilience. Main technology area: Reliability engineering / continuity.*
