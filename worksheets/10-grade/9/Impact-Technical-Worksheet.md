# Impact: Technical Worksheet

**Grade 10 · Worksheet · About 25 minutes**  
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

**What you will learn:** **Impact** is the effect a system has on people and on other systems. Some effects are **intended**. Others are **unintended**. A **metric** is a number used to judge success, and it can hide a harm. In this worksheet you will trace a checkout system from input to output and weigh **efficiency** against **fragility**.

**Do this:**

1. **Name one automated service** you have used (self-checkout, a ticket gate, a chatbot, an app-only door—any example).

   _________________________

2. **In one sentence**, what result were its designers most likely trying to produce?

   _________________________________________

---

## Part 2 – Intended and unintended effects (about 5 minutes)

**Intended impact** is the result the buyer or designer names in advance: shorter lines, fewer errors, less staff time on a repeated task. **Unintended impact** shows up anyway: a group who cannot finish the task, a new kind of error, or a job that moves rather than disappears. **Efficiency** means more completed work per minute. It does not tell you whether the people who needed help are better off.

**Real-life scenario:** A grocery chain replaces most staffed lanes with automated checkout. The dashboard tracks items scanned per minute and how many lanes are open. Average wait for a small basket falls. Shoppers paying with cash, using coupons, or buying an item the scale does not recognize wait longer. Staff who used to run registers now spend the shift clearing machine errors.

**Discuss with a partner or reflect in writing:** Which effects were the point of the project? Which effects would you not see if you only read “items per minute”?

_________________________________________
_________________________________________

**Do this:** Write **Intended** or **Unintended**, and name who feels it.

| Effect | Intended or unintended? | Who feels it? |
|--------|-------------------------|---------------|
| Small baskets move through faster | _____ | _____ |
| Cash and coupon payments take longer | _____ | _____ |
| The dashboard shows more items per minute | _____ | _____ |
| Staff time shifts from ringing up items to fixing stalls | _____ | _____ |

---

## Part 3 – A metric that misses the harm (about 5 minutes)

An average can improve while a smaller group gets worse. If the success rule uses only the average, the harm never counts as a failure. A second measure has to be chosen before the system launches, or it will be treated as a complaint instead of a result.

**Critical thinking:** Average wait fell, but wait time for shoppers who need a person rose. What second number would you require before calling the change a success? Say what would count as failure on that number.

_________________________________________
_________________________________________

**Do this:** For each metric, write what it shows and what it can miss.

| Metric | What it shows | What it can miss |
|--------|---------------|------------------|
| Items scanned per minute | _____ | _____ |
| Number of lanes open | _____ | _____ |
| Average wait for all baskets | _____ | _____ |
| Share of trips that needed a staff override | _____ | _____ |

---

## Part 4 – Faster, and easier to break (about 5 minutes)

Efficiency often concentrates a dependency. If every automated lane needs the same payment network, one outage stops sales even though the food is on the shelves. **Fragility** is that tendency to fail together. A design can keep one **local** path, such as a staffed lane that can finish a sale without that network.

**Real-life scenario:** On a Saturday the payment network drops. Every self-checkout freezes. The store still has one staffed lane that can take cash and write a receipt. The dashboard is blank. The local lane is not.

**Discuss with a partner or reflect in writing:** Which failure is urgent for shoppers in the next ten minutes, and which report can wait?

_________________________________________

**Do this:** Mark each function **Must work locally** or **Can wait**.

| Function | Must work locally or can wait? | Reason |
|----------|--------------------------------|--------|
| Finish a sale when the payment network is down | _____ | _____ |
| Update the company’s national items-per-minute chart | _____ | _____ |
| Call a person when a scale does not recognize an item | _____ | _____ |
| Email last week’s lane report to headquarters | _____ | _____ |

---

## Part 5 – Draw the dependency (about 5 minutes)

**Do this:**

1. **Sketch** the checkout system with at least four labels: scanner or scale, lane, payment network, and dashboard. Circle the link that makes the store fragile if it is the only path.

```
┌─────────────────────────────────────────┐
│  (Sketch the system. Circle the fragile │
│   link.)                                │
│                                         │
│                                         │
└─────────────────────────────────────────┘
```

2. **Write one design rule** that keeps a basic sale possible when that link fails.

   _________________________________________

---

## Part 6 – Check what you learned (about 2 minutes)

**Checklist.** Put a ✓ in the box when it is true for you.

- [ ] I can separate **intended** impact from **unintended** impact.
- [ ] I can explain why **efficiency** does not show whether people who need help are better off.
- [ ] I can say what a **metric** shows and what harm it can hide.
- [ ] I can mark which functions **must work locally** when a shared network fails.
- [ ] I can sketch a fragile dependency and write a rule that survives it.

When all boxes are checked, you have reviewed the main ideas from this worksheet.

---

*Worksheet on Impact (Technical). Central topic: Impact. Main technology area: Automated systems and how their effects are measured.*
