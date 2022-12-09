SELECT m.model, 
	   b.brand, 
	   comp.company, 
	   c.date_of_purchase, 
	   c.license_plate, 
	   cl.color, 
	   c.km_total, 
	   ic.insurance_company, 
	   i.insurance_number
	FROM aikaterini_margariti.companies AS comp
	JOIN aikaterini_margariti.brands AS b ON comp.id_company = b.id_company
	JOIN aikaterini_margariti.models AS m ON b.id_brand = m.id_brand
	JOIN aikaterini_margariti.cars AS c ON m.id_model = c.id_model
	JOIN aikaterini_margariti.colors AS cl ON c.id_color = cl.id_color
	JOIN aikaterini_margariti.insurances AS i ON i.id_car = c.id_car
	JOIN aikaterini_margariti.insurance_companies AS ic ON i.id_insurance_company = ic.id_insurance_company
