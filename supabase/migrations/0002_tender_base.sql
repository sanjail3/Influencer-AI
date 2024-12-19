/*
  # Add name field to waitlist table

  1. Changes
    - Add `name` column to `waitlist` table
    - Make `name` required for better user data collection
*/

DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'waitlist' AND column_name = 'name'
  ) THEN
    ALTER TABLE waitlist ADD COLUMN name text NOT NULL;
  END IF;
END $$;