

//Todo App Strings
//Todo Medical Certificate

const heading='MEDICAL CERTIFICATES';
const singleDayWork='Single-Day Certificate For Work';
const mDescription='Feel unwell and cannot attend work? Complete a quick online form which will be certified by one of our doctors. Please note, we cannot backdate certificates';
const buttonText='Request For referal';
const university='Single-Day Certificate For School/University';
const universityDes='Feel unwell and cannot attend school or university? Complete a quick online form which will be certified by one of our doctors. Please note, we cannot backdate certificates';
const leave='Single-Day Certificate For Carer’s Leave';
const leaveDes='Need to take a day off to care for an immediate family or household member? Complete a quick online form which will be certified by one of our doctors. Please note, we cannot backdate certificates';
const multipleDay='Multiple-Day Certificate';
const multipleDayDes='If you need a medical certificate that covers several days, you will need to have a telehealth consultation with a doctor to discuss your needs. Please note, we cannot back date certificates';
const costDescription='If approved by a doctor, your medical certificate will be sent to your email.The medical certificate will be issued for today only. If you require a medical certificate for multiple days in a row, you will require a telehealth consultation with one of our doctors.If you need to speak to a doctor about the right treatment for you or a child (under the age of 18), please request a Telehealth Consultation.';
const costTitle='The cost of this referral is  ${40.00}';
const additionalInformation='Please provide additional information to help our doctors review your request. This will not appear on the Medical Certificate.';
//Todo List of the HEADING


List<String>medicalDescriptionTitles=[
  'Single-Day Certificate For Work',
  'Single-Day Certificate For School/University',
  'Single-Day Certificate For Carer’s Leave',
  'Multiple-Day Certificate'
];
List<String>medicalDescription=[
  'Feel unwell and cannot attend work? Complete a quick online form which will be certified by one of our doctors. Please note, we cannot backdate certificates',
  'Feel unwell and cannot attend school or university? Complete a quick online form which will be certified by one of our doctors. Please note, we cannot backdate certificates',
  'Need to take a day off to care for an immediate family or household member? Complete a quick online form which will be certified by one of our doctors. Please note, we cannot backdate certificates',
  'If you need a medical certificate that covers several days, you will need to have a telehealth consultation with a doctor to discuss your needs. Please note, we cannot back date certificates'
];

List<String>questions=[
  '1. Do you feel unfit for work today?',
  '2.Do you have any of the following symptoms: Fever over 39 degrees, extreme pain in the head or abdomen, vision disturbances, uncontrolled and excessive vomiting?',
  '3. Would you describe your symptoms as mild and not requiring urgent medical attention?',
  '4. Will you see your doctor within the next few days if your symptoms are not improving?',
  '5. I am currently located in Australia',
  '6. Do you understand everything that is written above or do you require assistance or language interpretation?'
];

//Todo request consultaion

const generalTitle='TELEHEALTH CONSULTATIONS';
const generalCons='General Consultation';
const general='General';
const generalDes='Our Telehealth services are available anywhere in Australia from 6am to midnight every day of the week';
const referal='Request A Referral';
const otherCons='Other Consultations';

//Todo other consulation

List<String>otherConsulationTitles=[
  'Mental Health Care Plan/Review',
  'COVID-19 Oral Antiviral Treatments',
  'Hair Loss',
  'Smoking Cessation',
  'Weight Management',
  'Alternative Therapies',
  'UTI Consult'
];
List<String>otherConsulationDesc=[
  'A video consultation with a doctor for a Mental Health Care Plan (20 minutes) or Review. Includes a referral to a psychologist',
  'New oral antiviral treatments are now available for people at risk of becoming unwell from COVID-19. See if you are eligible',
  'Speak to one of our experienced doctors about a tailored Hair Loss program to help improve hair regrowth.',
  'Quit smoking for good through our medically guided smoking cessation program',
  'An expert program designed for ongoing weight management. Includes a pathology test and a consultation with a doctor.',
  'Consult with a doctor experienced in prescribing alternative medications for a range of conditions.',
  'Speak to one of our experienced doctors about treatment options if you are experiencing symptoms of a Urinary Tract Infection (UTI).'
];

//Todo refered specialist

const specialistHeading='SPECIALIST REFERRALS';
const skin='SKIN';
const eyes='EYES';
const colonosopy='COLONOSOPY';


List<String>skinListTitles=[
  'Dermatology Referral For Acne',
  'Dermatology Referral For General Skin/Mole Check'
];
List<String>skinListSubtitles=[
  'A doctor referral to a dermatologist for acne.',
  'A doctor referral to a dermatologist for a skin/mole check to check for melanoma and other skin cancers.'
];

//todo EYes


List<String>eyesTitlesList=[
  'Ophthalmologist Referral For Age-Related Macular Degeneration',
  'Ophthalmologist Referral For Cataracts',
  'Ophthalmologist Referral For Diabetes',
  'Ophthalmologist Referral For Glaucoma'
];
List<String>eyesSubtitlesList=[
  'For people over 50 years of age to check for any vision loss.',
  'To check for cataracts which can cause visual problems.',
  'For diabetics, who should get an eye check to screen for Diabetic Retinopathy (eye disease).',
  'To review or check for signs of glaucoma which can cause vision loss.'
];

//todo colonoscopy

List<String>colonoscopyTitleList=[
  'Gastroenterology (Colonoscopy) Referral For Initial Screen',
  'Gastroenterology (Colonoscopy) Referral For 3?5-Year Follow-Up',
  'Can?T Find What You Need?'
];
List<String>colonoscopySubTitleList=[
  'For patients over 50 years of age with risk factors such as family history or bowel symptoms like rectal bleeding or altered bowel habit.',
  'For those patients that get a regular colonoscopy every 3-5 years as part of surveillance to check for polyps and bowel cancer.',
  'Request a telehealth consultation with one of our doctors and they can help you access a wide range of specialist referrals.'
];

//TODO BLOOD TEST


const pathology='PATHOLOGY';
const bloodTest='BLOODTEST';
const popular='Popular Blood Tests';
const otherGeneral='Other General Tests';
const womenTest='Women’s Tests';
const menTest='Men’s Tests';

List<String>bloodTestTitles=[
  'General Health Blood Test',
  'STI Blood Test',
  'Vegan Blood Test'
];

List<String>bloodTestSubtitle=[
  'Examines a range of cells, nutrients, hormones and organ function indicators in your associated with general health and wellness.',
  'A sexual health test testing for Chlamydia, Gonorrhoea, Syphilis, HIV and Hepatitis',
  'Vegetarians and vegans need to keep tabs on specific nutrient levels to ensure they aren’t deficient. This test includes most common tests aimed at vegans.'
];

//Todo other general test


List<String>otherGeneralTestTitles=[
  'Why Am I Sick All The Time? Blood Test',
  'Why Am I Tired? Blood Test',
  'Irritable Bowel Test',
  'Food Intolerance Breath Test',
  'COVID PCR Test'
];

List<String>otherGeneralTestSub=[
  'Blood test to check immune function',
  'Examines a range of cells, nutrients, hormones and organ function indicators in your blood that may explain why you are tired.',
  'Tests to investigate causes of irritable bowel symptoms including coeliac disease',
  'Food intolerance breath tests',
  'A mouth and nose swab to test for COVID-19'
];

//todo women test


List<String>womenTitles=[
  'Polycystic Ovarian Syndrome (PCOS) Risk Blood Test',
  'Women’s Fertility Blood Test',
  'Pregnancy Blood Test',
  'Pregnancy Planning Blood Test',
];

List<String>womenSubtitles=[
  'Measures blood hormones associated with Polycystic Ovarian Syndrome (PCOS).',
  'Measures blood hormones that are known to influence the fertility of women.',
  'Measures blood levels of HCG, the most accurate way to test for pregnancy',
  'For women planning pregnancy',

];

//todo men

List<String>menTitles=[
  'Men’s Fertility Blood Test',
  'Erectile Dysfunction Blood Test',
];

List<String>menSubtitles=[
  'Measures semen and sperm function that is followed up with a telehealth consultation',
  'Checks for organic causes of erectile dysfunction'
];

//todo disease list

List<String> healthConditions = [
  "Acne",
  "Asthma",
  "Anxiety",
  "Blood clots",
  "Bowel polyps",
  "Cancer",
  "Cataracts",
  "Chronic fatigue syndrome",
  "Chronic pain",
  "Crohn’s Disease",
  "Coeliac disease",
  "COPD/Emphysema",
  "Dementia",
  "Depression",
  "Diabetes",
  "Diverticular disease",
  "Eczema",
  "Endometriosis",
  "Epilepsy",
  "Glaucoma",
  "Gout",
  "Heart disease",
  "High blood pressure",
  "High Cholesterol",
  "HIV",
  "Hyperthyroidism (overactive thyroid)",
  "Hypothyroidism (underactive thyroid)",
  "IBS",
  "Kidney disease",
  "Liver disease",
  "Macular degeneration",
  "Melanoma",
  "Migraines/Chronic headaches",
  "Multiple Sclerosis",
  "Obesity",
  "Osteoarthritis",
  "Osteoporosis",
  "Parkinson’s",
  "Psoriasis",
  "Polycystic ovary syndrome",
  "Reflux/Heartburn",
  "Rheumatoid arthritis",
  "SCC/BCC skin cancers",
  "Stroke",
  "Ulcerative Colitis",
];


//todo cart


const cart='CART';
