INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_cayobeans', 'Cayo Beans', 1)
;

INSERT INTO `addon_account_data` (id, account_name, money, owner)
VALUES (0, 'society_cayobeans', 0, NULL);

INSERT INTO `jobs` (name, label) VALUES
	('cayobeans', 'Cayo Beans')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cayobeans',0,'recruit','Producteur',0,'{}','{}'),
    ('cayobeans',1,'resp','Responsable',0,'{}','{}'),
	('cayobeans',2,'boss','Patron',0,'{}','{}')
;