
# OpenStreetMap Testumgebung (LDBV)

Diese Testumgebung dient dazu, JOSM mit spezifischen LDBV-Plugins zusammen mit einer OpenStreetMap-Webseite und einem passenden ATKIS-Datenbankschema zu betreiben. Die Umgebung basiert vollständig auf Docker.

---

## 📁 Projektstruktur

```text
openstreetmap-test-environment/
├── josm/                      # JOSM-Editor mit Plugins, Styles und Presets
├── openstreetmap-website/     # OpenStreetMap-Website inkl. API und Datenbank
├── openstreetmap-schema/      # ATKIS® Basis-DLM BY Schema
└── docker-compose.yml         # Definition aller Services
```

---

## 📦 Voraussetzungen

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 🚀 Installation & Start

1. **Repository klonen (inkl. Submodule):**

   ```bash
   git clone --recurse-submodules https://github.com/ldbv-by/openstreetmap-test-environment.git
   cd openstreetmap-test-environment
   ```

2. **Testumgebung starten:**

   ```bash
   docker compose up --build
   ```

3. **Zugang zum JOSM-Editor:**
- **Im Browser (via noVNC):**  
  🖥️ [http://localhost:6901/vnc.html](http://localhost:6901/vnc.html)  
  🔑 Standard-Passwort: `headless`  


- **Mit einem VNC-Client:**  
  🖥️ Serveradresse: `localhost:5901`  
  🔑 Standard-Passwort: `headless`

    → Weitere Infos: [accetto.github.io](https://accetto.github.io/user-guide-g3/container-user/)

---

## 🧭 Dienste im Überblick

### 🗺️ JOSM

Im JOSM-Container wird der JOSM-Editor über **VNC** bereitgestellt.
Auf dem Startbildschirm befindet sich die Anwendung **JOSM-BVV**, über die der Editor mit den vorkonfigurierten Plugins, Styles und Presets gestartet werden kann.

### 🧩 openstreetmap-schema

Dieser Dienst stellt das **ATKIS® Basis-DLM BY Schema** zur Verfügung.
Die im JOSM-Editor integrierten Plugins nutzen diesen Dienst, um die Datenbankstruktur des ATKIS-Modells darzustellen und entsprechend zu interpretieren.

👉 Die API-Dokumentation ist unter folgendem Link verfügbar: [Swagger UI öffnen](http://localhost:8081/openstreetmap-schema/)

### 🌐 OpenStreetMap Website

Die OSM-Website stellt die vollständige OSM-API samt zugehöriger Datenbank bereit, die mit Testdaten aus Bayern befüllt ist.

---

## 🔧 VNC-Auflösung anpassen

Standardmäßig startet der Desktop im VNC in **Full HD (1920×1080)**.  
Wenn du die Auflösung ändern willst, setze die Umgebungsvariable **`VNC_RESOLUTION`** in deiner `docker-compose.yml`, z. B.:

```yaml
services:
  josm:
    build: .
    environment:
      - VNC_RESOLUTION=2560x1440   # Beispiel: QHD
    ports:
      - "5901:5901"  # VNC
      - "6901:6901"  # noVNC

```

---

## 🧹 Beenden & Aufräumen

Um die Umgebung zu stoppen:

```bash
docker compose down
```

Optional inkl. Volumes:

```bash
docker compose down -v
```

---

## 📝 Lizenz & Hinweise

Dieses Projekt dient ausschließlich zu Test- und Evaluierungszwecken.  
Für den produktiven Einsatz oder externe Veröffentlichung sind Anpassungen notwendig.
