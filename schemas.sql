-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(100) COLLATE pg_catalog."default",
    last_name character varying(100) COLLATE pg_catalog."default",
    phone_number character varying(20) COLLATE pg_catalog."default",
    is_active boolean DEFAULT true,
    last_login timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_email_key UNIQUE (email)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;


-- Table: public.profiles

-- DROP TABLE IF EXISTS public.profiles;

CREATE TABLE IF NOT EXISTS public.profiles
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id uuid,
    sex character varying(10) COLLATE pg_catalog."default",
    birth_date date,
    blood_type character varying(5) COLLATE pg_catalog."default",
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT profiles_pkey PRIMARY KEY (id),
    CONSTRAINT profiles_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.profiles
    OWNER to postgres;

    -- Table: public.doctor_visits

-- DROP TABLE IF EXISTS public.doctor_visits;

CREATE TABLE IF NOT EXISTS public.doctor_visits
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id uuid,
    visit_date text COLLATE pg_catalog."default",
    doctor_name character varying(255) COLLATE pg_catalog."default",
    reason text COLLATE pg_catalog."default",
    diagnosis text COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT doctor_visits_pkey PRIMARY KEY (id),
    CONSTRAINT doctor_visits_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.doctor_visits
    OWNER to postgres;

INSERT INTO public.users (
  id, email, first_name, last_name, phone_number, last_login
) VALUES (
  '11111111-1111-1111-1111-111111111111',
  'john.doe@example.com',
  'John',
  'Doe',
  '+1234567890',
  CURRENT_TIMESTAMP
);


INSERT INTO public.doctor_visits (
  id, user_id, visit_date, doctor_name, reason, diagnosis, notes
) VALUES
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-01-15', 'Dr. Alice Hart', 'Routine check-up', 'Healthy', 'No issues noted.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-02-10', 'Dr. Ben Carver', 'Allergy symptoms', 'Pollen allergy', 'Prescribed antihistamines.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-03-05', 'Dr. Clara Lee', 'Stomach ache', 'Gastritis', 'Advised dietary changes.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-04-22', 'Dr. Dan Morgan', 'Knee pain', 'Tendon strain', 'Recommended physical therapy.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-05-18', 'Dr. Erin Kim', 'Skin rash', 'Eczema', 'Prescribed topical steroid.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-06-12', 'Dr. Fred Gomez', 'Flu symptoms', 'Influenza', 'Rest and fluids advised.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-07-01', 'Dr. Grace Lin', 'Eye irritation', 'Conjunctivitis', 'Antibiotic eye drops prescribed.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-08-09', 'Dr. Henry Fox', 'Fatigue', 'Vitamin D deficiency', 'Supplements recommended.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-09-17', 'Dr. Ivy Chen', 'Back pain', 'Muscle strain', 'Warm compress and rest.'),
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '2024-10-25', 'Dr. Jack Novak', 'Headache', 'Migraine', 'Prescribed migraine meds.');
