## Doppelgänger Mirror - Interactive Kinetic Artwork  
*Graduation Project by CHE Yiwen, 2020 China Academy of Art*  

---

<br>

> **"The Doppelgänger Mirror is a cyborgian self — half-machine, half-ghost. It stares back not with malice, but with the indifferent precision of algorithms that now define our digital identities. In its mechanical gaze, we confront the exhaustion of performing for invisible audiences."**    — CHE Yiwen

<br>

### 🪞 Description  

#### Concept  
An interactive kinetic mirror exploring digital-age self-alienation through Lacanian mirror theory. The installation physically mimics a viewer's head movements during self-observation, transforming from a passive object to an active "doppelgänger" – a ghostly double-absorbing human behavior. It critiques performative self-surveillance in digital spaces and evokes anxiety about technology's colonization of identity.  

#### Key Metaphors  
- **Doppelganger**: Folkloric double as digital "algorithmic self"  
- **Mirror as Screen**: Replaces Lacan’s optical mirror with voyeuristic interfaces  
- **Mechanical Life**: Acrylic skeleton + exposed wires as artificial "bones and veins"  

#### Interaction Design  
When viewers attempt peripheral self-observation:  
1. Mirror probes back with uncanny mimicry  
2. Prolonged interaction reveals loss of control  
3. Exposes tension between self-exploration & technological manipulation  

#### Theoretical Grounding  
- Lacan’s mirror stage  
- Digital narcissism  
- Post-human anxiety  

<br>

---

### ⚙️ Technical Inventory  

#### Hardware Components  
| **Component**          | **Specification**                     | **Function**                              |  
|-------------------------|---------------------------------------|------------------------------------------|  
| **Motion System**       | 4 × 15g servo motors + custom arms    | Simulates head tilt/yaw/nod              |  
| **Mirror Assembly**     | 14cm round mirror (center-mounted)    | Primary visual interface                 |  
| **Frame**               | Custom-cut acrylic structure           | Skeleton with visible "joints"           |  
| **Control Unit**        | Arduino UNO Rev3 + I/O Shield         | Motor command execution                  |  
| **Vision Capture**      | Fixed micro webcam (front-bottom)     | Real-time face tracking                  |  
| **Power & Wiring**      | Exposed Dupont cables                 | "Vessels" pulsing with current           |  

#### Software Stack  
| **Tool**                | **Role**                                  |  
|-------------------------|------------------------------------------|  
| **FaceOSC**             | Tracks 132 facial mesh points + gestures  |  
| **Processing**          | Maps facial data → servo angles          |  
| **Arduino IDE**         | Firmware for motor control               |  

#### Algorithm Workflow  
```mermaid
graph LR
A[Webcam Capture] --> B(FaceOSC)
B --> C{Generate Data<br>132 XY values<br>poseScale/orientation}
C --> D[Processing]
D --> E[Map to Servo Angles]
E --> F[Arduino UNO]
F --> G[Servo Motion]
