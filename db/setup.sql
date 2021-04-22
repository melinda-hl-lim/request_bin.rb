CREATE TABLE bins (
  slug varchar(255), 
  created_at timestamp DEFAULT NOW()
  updated_at timestamp DEFAULT NOW()
);

CREATE TABLE requests (
  payload varchar(MAX),
  bin_id int FOREIGN KEY, 
  created_at timestamp DEFAULT NOW()
  updated_at timestamp DEFAULT NOW()
);