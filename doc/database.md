
````mermaid
erDiagram
    %% Beziehungen ohne Text-Labels, um Überlagerungen zu vermeiden
    stations ||--o{ route_stops : ""
    stations ||--o{ stop_times : ""
    lines ||--o{ vehicles : ""
    lines ||--o{ route_stops : ""
    lines ||--o{ stop_times : ""

    stations {
        int id PK
        text name
        text display_name
        float lat
        float lon
        varchar rmv_id
        bool is_active
    }

    lines {
        int id PK
        varchar line_name
        text line_direction
        varchar color
    }

    vehicles {
        int id PK
        varchar vehicle_number
        int line_id FK
        varchar vehicle_type
        float lat
        float lon
        float speed
        timestamp last_update
    }

    route_stops {
        int id PK
        int line_id FK
        int station_id FK
        int stop_number
        bool direction
    }

    stop_times {
        int id PK
        int line_id FK
        int stop_id FK
        datetime planned_arrival
        datetime planned_departure
        datetime real_arrival
        datetime real_departure
        timestamp last_update
    }
````