# Smart Campus - Multi-Department Timetable & Resource Scheduling Engine

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/Sreehasa123/Intelligent-Timetable-and-Resource-Scheduling-Agent)

A comprehensive, production-ready scheduling and facility tracking platform built for **Vignan's Foundation for Science, Technology and Research (VFSTR)**. The platform features an intelligent timetable matrix, live vacancy tracker for classrooms and computing laboratories, deduplicated faculty directory, and a grounded AI assistant powered by Groq LLM.

---

## 🌟 Key Features

1. **Live Campus Availability Dashboard**:
   - Real-time occupancy tracking for all academic blocks based on system clock and verified timetable schedules.
   - Status tracking across 44 Academic Sections, 217 Faculty Members, and 46 Classrooms & Specialized Labs.

2. **Deduplicated Faculty Directory**:
   - Canonical faculty profiles across all departments (CS, DS, CSBS, IoT, AIML, BS-DS, M.Sc-DS, M.Tech).
   - Period-by-period availability checking (Periods 1 through 8).

3. **Academic Facilities & Computing Labs Tracker**:
   - Instant occupied vs. unoccupied detection.
   - Transparent identification of shared department laboratories and non-AIML sessions.

4. **Multi-Cohort Timetable Matrix**:
   - Full weekly schedule grids across all 44 academic cohorts with instructor, course, and room allocations.

5. **Grounded AI Scheduling Assistant**:
   - Retrieval-Augmented Generation (RAG) assistant connected to SQLite database.
   - Powered by Groq LLM (`llama-3.3-70b-versatile`) for natural, zero-hallucination queries.

---

## 🏗️ Architecture & Technology Stack

- **Frontend**: React 18, Vite, Tailwind CSS, Lucide Icons (Compiled to `frontend/dist`)
- **Backend**: Django 5.1, Django REST Framework, WhiteNoise (Static Asset Delivery), Gunicorn (WSGI)
- **Database**: SQLite3 (bundled production data with 908 active sessions), extensible to MySQL 8.4
- **AI / LLM**: Groq Cloud SDK (`groq>=1.7.0`)
- **Deployment**: Render.com (Docker Multi-Stage Container / Native Python)

---

## 🚀 Instant Deployment on Render.com

### Method 1: One-Click Blueprint Deploy (Recommended)
Click the button below to deploy this repository directly to Render using `render.yaml`:

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/Sreehasa123/Intelligent-Timetable-and-Resource-Scheduling-Agent)

### Method 2: Manual Web Service Setup
1. Log in to [Render.com](https://dashboard.render.com).
2. Click **New +** → **Web Service**.
3. Choose **Build and deploy from a Git repository**.
4. Connect this GitHub repository: `https://github.com/Sreehasa123/Intelligent-Timetable-and-Resource-Scheduling-Agent`.
5. Configure the service:
   - **Name**: `smart-campus-timetable`
   - **Language**: `Docker`
   - **Dockerfile Path**: `./Dockerfile`
   - **Plan**: `Free`
6. (Optional) Set Environment Variables:
   - `GROQ_API_KEY`: *(Optional, your Groq API key for AI assistant)*
   - `DEBUG`: `False`
   - `ALLOWED_HOSTS`: `*`
   - `PORT`: `10000` (Render manages this automatically)
7. Click **Deploy Web Service**.

Your service will build and provide a permanent public URL: `https://<your-service-name>.onrender.com`.

---

## ⚙️ Environment Variables

| Variable | Default | Purpose |
| :--- | :--- | :--- |
| `PORT` | `10000` | Port assigned by Render for HTTP traffic |
| `DEBUG` | `False` | Toggle Django debug mode |
| `ALLOWED_HOSTS` | `*` | Allowed host headers |
| `DB_ENGINE` | `sqlite` | Database engine (`sqlite` or `mysql`) |
| `GROQ_API_KEY` | *(Built-in)* | Groq API key for conversational AI assistant |

---

## 💻 Local Development

### 1. Backend
```bash
cd backend
python -m venv .venv
source .venv/bin/activate  # Or .venv\Scripts\activate on Windows
pip install -r requirements.txt
python manage.py runserver 0.0.0.0:8000
```

### 2. Frontend
```bash
cd frontend
npm install
npm run dev
```

Visit `http://localhost:5173` for the Vite development server with hot-reload.
