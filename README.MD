
# OpenStreetMap Testumgebung

Die Testumgebung bildet einen isolierten Ausschnitt der **OpenStreetMap-(OSM-)Infrastruktur** ab und dient der editorunabhängigen Überprüfung der Datenqualität. Sie basiert auf der Nutzung der OSM-Editoren **JOSM** und **iD**, die unterschiedliche Bearbeitungs- und Nutzungsszenarien innerhalb des OSM-Ökosystems repräsentieren.

In diese Umgebung ist ein **editorunabhängiges Qualitätsprüfungsframework** integriert. Die Einbindung erfolgt über ein **API-Gateway**, das als zentrale Schnittstelle zwischen den Editoren, der OSM-Infrastruktur und dem Qualitätsprüfungsframework fungiert. Dadurch wird sichergestellt, dass die Qualitätsprüfung unabhängig vom jeweils eingesetzten Editor erfolgt und einheitlich auf die erfassten Geodaten angewendet werden kann.

Die Überprüfung der Datenqualität erfolgt gemäß den Vorgaben der **GeoInfoDok (Version 7.1.2)** der Arbeitsgemeinschaft der Vermessungsverwaltungen der Länder der Bundesrepublik Deutschland (AdV). Die in der GeoInfoDok beschriebenen Anforderungen werden durch das Qualitätsprüfungsframework in prüfbare Regeln überführt und innerhalb der Testumgebung automatisiert ausgewertet.

---

## 📁 Projektstruktur

```text
openstreetmap-test-environment/
├── josm/                               # JOSM-Editor
├── openstreetmap-website/              # OpenStreetMap-Website inkl. iD, API und Datenbank
├── openstreetmap-api-gateway/          # API-Gateway als Vermittlungsschicht zwischen Editoren und OSM-Infrastruktur
├── openstreetmap-quality-framework/    # Qualitätsprüfungsframework zur Datenvalidierung
├── openstreetmap-website/              # OpenStreetMap-Website inkl. API und Datenbank
└── docker-compose.yml                  # Definition aller Services
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
   git clone --recurse-submodules -b adv https://github.com/ldbv-by/openstreetmap-test-environment.git
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

4. **Zugang zum iD-Editor:**
- **Im Browser:**  
  🖥️ [http://localhost:3000/](http://localhost:3000/)  
  👤 iD-Benutzer: `iD-user`
  
  🔑 iD-Passwort: `password`
---

## 🧭 Dienste im Überblick

### 🗺️ JOSM

Im JOSM-Container wird der JOSM-Editor über **VNC** bereitgestellt.
Auf dem Startbildschirm befindet sich die Anwendung **JOSM-BVV**, über die der Editor mit den vorkonfigurierten Plugins, Styles und Presets gestartet werden kann.

### 🌐 iD

Der iD-Editor ist über die lokal bereitgestellte OpenStreetMap-Weboberfläche im Browser verfügbar.
Er ermöglicht eine browserbasierte Bearbeitung der OSM-Daten und adressiert insbesondere einfache und geführte Bearbeitungsszenarien.
Für Testzwecke ist standardmäßig ein Benutzerkonto mit dem Benutzernamen iD-user eingerichtet, über das Bearbeitungen innerhalb der Testumgebung durchgeführt werden können.

### 🌐 OpenStreetMap Website

Die OpenStreetMap-Website stellt innerhalb der Testumgebung eine lokale Implementierung der vollständigen OSM-API einschließlich der zugehörigen OSM-Datenbank bereit.
Sie bildet damit die zentrale Infrastruktur für das Speichern, Abrufen und Verwalten der OSM-Geodaten.

Die lokale Instanz ist vollständig vom produktiven OpenStreetMap-System entkoppelt und kann mit beliebigen, projektspezifischen Testdaten initialisiert und betrieben werden.

### 🚪 OpenStreetMap API-Gateway

Das API-Gateway fungiert als zentrale Vermittlungsschicht zwischen den OSM-Editoren, der OpenStreetMap-API und dem Qualitätsprüfungsframework.
Alle Änderungsanfragen der Editoren werden über das Gateway geleitet und dort weiterverarbeitet.

### ✅ OpenStreetMap Quality-Framework

Das Qualitätsprüfungsframework übernimmt die automatisierte Überprüfung der in der Testumgebung erfassten Geodaten.
Die Prüfungen basieren auf den in der GeoInfoDok (Version 7.1.2) definierten fachlichen und strukturellen Anforderungen.

Die dort beschriebenen Vorgaben werden in maschinenlesbare Prüfregeln überführt und auf die durch die Editoren erzeugten Daten angewendet. Die Ergebnisse der Qualitätsprüfung können zur Identifikation von Datenfehlern, Inkonsistenzen und Regelverletzungen herangezogen werden.

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
