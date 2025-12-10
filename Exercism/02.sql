CREATE TABLE people (
    name TEXT
);

INSERT INTO people (name) VALUES
    ('Alice'),
    ('Bohdan'),
    (NULL),
    ('Zaphod'),
    ('');  -- vazio
SELECT 
    CASE 
        WHEN name IS NULL OR name = '' 
            THEN 'One for you, one for me.'
        ELSE 
            'One for ' || name || ', one for me.'
    END AS dialogue
FROM people;
