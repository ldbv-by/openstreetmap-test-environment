
# OpenStreetMap Testumgebung (LDBV)

Diese Testumgebung dient dazu, JOSM mit spezifischen LDBV-Plugins zusammen mit einer OpenStreetMap-Webseite und einem passenden ATKIS-Datenbankschema zu betreiben. Die Umgebung basiert vollständig auf Docker.

---

## 📦 Voraussetzungen

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

   Dies baut und startet folgende Services:

   - `db` – PostgreSQL-Datenbank
   - `web` – OpenStreetMap-Webseite
   - `openstreetmap-schema` – enthält das ATKIS-BasisDLM-Schema für Bayern
   - `josm` – JOSM-Editor mit LDBV-spezifischen Plugins (wird automatisch gestartet)

---

## 🧭 Dienste im Überblick

### 🗺️ JOSM (mit LDBV-Plugins)

Der JOSM-Container wird **automatisch gestartet** und läuft mit grafischer Benutzeroberfläche via X11 (erfordert X11-Unterstützung auf dem Host, z. B. unter Linux oder WSL2 mit X-Server) 
Er enthält bereits alle relevanten Plugins für die Darstellung und Bearbeitung von ATKIS-Daten nach AdV-Vorgaben.

Falls du JOSM zwischenzeitlich schließt, kannst du ihn mit folgendem Befehl erneut starten:

```bash
docker start josm
```

### 🧩 openstreetmap-schema

Dieser Dienst stellt das **ATKIS BasisDLM BY Schema** bereit.  
Die Plugins im JOSM greifen auf diesen Dienst zu, um die Datenbankstruktur für ATKIS darzustellen.

[Swagger UI öffnen](http://localhost:8081/openstreetmap-schema/)

### 🌐 OpenStreetMap Website

Die OSM-Website stellt die OSM-API mit dazugehöriger OSM-DB bereit, welche mit Testdaten aus Bayern befüllt wird.

---

## 📁 Verzeichnisstruktur

```text
openstreetmap-test-environment/
├── josm/                      # Docker-Build für JOSM mit Plugins
├── openstreetmap-website/     # Code + Dockerfile für OSM-Webseite
├── openstreetmap-schema/      # Docker-Build für ATKIS-Schema-Service
└── docker-compose.yml         # Definition aller Services
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
