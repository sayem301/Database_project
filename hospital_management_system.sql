-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 08:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulance`
--

CREATE TABLE `ambulance` (
  `id` int(11) NOT NULL,
  `vehicle_number` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `service_area` varchar(20) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `ambulance_fare` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambulance`
--

INSERT INTO `ambulance` (`id`, `vehicle_number`, `type`, `status`, `service_area`, `staff_id`, `ambulance_fare`) VALUES
(1, 'A526', 'Ambulance', 'Available', 'Emergency Room', 15, 5000.00),
(2, 'B213', 'Ambulance', 'In Use', 'Cardiology Departmen', 14, 6000.00),
(3, 'C789', 'Ambulance', 'Available', 'Pediatrics Departmen', 13, 4500.00),
(4, 'D456', 'Ambulance', 'In Use', 'Surgery Department', 12, 5500.00),
(5, 'E789', 'Ambulance', 'Available', 'Emergency Room', 11, 5000.00),
(6, 'F123', 'Ambulance', 'In Use', 'Orthopedics Departme', 10, 6000.00);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reason` varchar(30) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `status`, `date`, `time`, `reason`, `patient_id`, `doc_id`) VALUES
(1, 'admitted', '2024-06-05', '09:00:00', 'General Checkup', 1, 5),
(2, 'admitted', '2024-06-06', '10:30:00', 'Flu Symptoms', 2, 3),
(3, 'admitted', '2024-06-07', '11:00:00', 'Follow-up', 3, 8),
(4, 'admitted', '2024-06-08', '14:00:00', 'Back Pain', 4, 10),
(5, 'admitted', '2024-06-09', '15:30:00', 'Blood Test', 5, 12),
(6, 'admitted', '2024-06-10', '08:30:00', 'Skin Rash', 6, 7),
(7, 'admitted', '2024-06-11', '09:45:00', 'Headache', 7, 15),
(8, 'admitted', '2024-06-12', '10:15:00', 'Follow-up', 8, 9),
(9, 'admitted', '2024-06-13', '13:00:00', 'Diabetes Check', 9, 6),
(10, 'admitted', '2024-06-14', '14:30:00', 'X-ray', 10, 11),
(11, 'admitted', '2024-06-15', '08:00:00', 'General Checkup', 11, 20),
(12, 'admitted', '2024-06-16', '09:15:00', 'Chest Pain', 12, 21),
(13, 'admitted', '2024-06-17', '10:00:00', 'Allergy Test', 13, 22),
(14, 'admitted', '2024-06-18', '11:30:00', 'Flu Symptoms', 14, 4),
(15, 'admitted', '2024-06-19', '13:45:00', 'Eye Checkup', 15, 18);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `location`, `email`, `phone`) VALUES
(1, 'Cardiology', 'Building A, Floor 2', 'cardiology@hospital.', '555-1234'),
(2, 'Neurology', 'Building B, Floor 3', 'neurology@hospital.c', '555-2345'),
(3, 'Oncology', 'Building C, Floor 1', 'oncology@hospital.co', '555-3456'),
(4, 'Pediatrics', 'Building A, Floor 4', 'pediatrics@hospital.', '555-4567'),
(5, 'Orthopedics', 'Building B, Floor 2', 'orthopedics@hospital', '555-5678'),
(6, 'Emergency', 'Building D, Ground Floor', 'emergency@hospital.c', '555-6789');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `symptoms` varchar(30) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`id`, `name`, `symptoms`, `dept_id`) VALUES
(1, 'Influenza', 'Fever, Cough, Fatigue', 2),
(2, 'Asthma', 'Wheezing, Shortness of Breath', 3),
(3, 'Diabetes', 'Increased Thirst, Fatigue', 4),
(4, 'Hypertension', 'Headache, Dizziness', 1),
(5, 'COVID-19', 'Fever, Cough, Loss of Taste', 2),
(6, 'Pneumonia', 'Chest Pain, Cough, Fever', 3),
(7, 'Tuberculosis', 'Cough, Night Sweats, Weight Lo', 5),
(8, 'Malaria', 'Fever, Chills, Sweats', 6),
(9, 'Arthritis', 'Joint Pain, Stiffness', 4),
(10, 'Migraine', 'Headache, Nausea, Sensitivity ', 1),
(11, 'Bronchitis', 'Cough, Chest Discomfort', 3),
(12, 'Anemia', 'Fatigue, Weakness, Pale Skin', 2),
(13, 'Epilepsy', 'Seizures, Loss of Consciousnes', 5),
(14, 'Cystic Fibrosis', 'Cough, Lung Infections', 3),
(15, 'Hepatitis', 'Jaundice, Fatigue, Nausea', 6);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `specialization` varchar(20) NOT NULL,
  `qualifications` varchar(20) NOT NULL,
  `license_number` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `hospital_salary` decimal(8,2) NOT NULL,
  `visiting_hour` varchar(10) NOT NULL,
  `visiting_fee` decimal(8,2) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `specialization`, `qualifications`, `license_number`, `phone`, `email`, `hospital_salary`, `visiting_hour`, `visiting_fee`, `dept_id`, `room_id`) VALUES
(1, 'Dr. Miller picasha', 'Radiology', 'DM', 'EN-75180', '+1-744-4577', 'dr.miller@hospital.c', 99443.00, '11 AM - 1 ', 6000.00, 5, 9),
(2, 'Dr. Rodriguez picash', 'Psychiatry', 'DM', 'EN-35574', '+1-597-1461', 'dr.rodriguez@hospita', 113785.00, '9 AM - 11 ', 7000.00, 1, 11),
(3, 'Dr. Brown   picasha', 'Dermatology', 'DO', 'EN-12648', '+1-370-1052', 'dr.brown@hospital.co', 105632.00, '9 AM - 11 ', 5000.00, 5, 10),
(4, 'Dr. Rodriguez suza', 'Cardiology', 'DM', 'EN-65978', '+1-978-9879', 'dr.rodriguez@hospita', 110610.00, '2 PM - 4 P', 3000.00, 4, 12),
(5, 'Dr. Rodriguez yata', 'Oncology', 'DNB', 'EN-44546', '+1-960-4642', 'dr.rodriguez@hospita', 93768.00, '9 AM - 11 ', 9000.00, 2, 12),
(6, 'Dr. Johnson picasha', 'Pediatrics', 'MD', 'EN-61858', '+1-819-1239', 'dr.johnson@hospital.', 106102.00, '4 PM - 6 P', 10000.00, 3, 11),
(7, 'Dr. Jones picasha', 'General Surgery', 'MS', 'EN-57246', '+1-183-8389', 'dr.jones@hospital.co', 101990.00, '4 PM - 6 P', 2000.00, 5, 10),
(8, 'Dr. Garcia', 'Oncology', 'DNB', 'EN-64784', '+1-421-7358', 'dr.garcia@hospital.c', 134093.00, '11 AM - 1 ', 4000.00, 4, 9),
(9, 'Dr. Davis', 'Radiology', 'DM', 'EN-63971', '+1-285-9905', 'dr.davis@hospital.co', 148121.00, '4 PM - 6 P', 8000.00, 5, 9),
(10, 'Dr. Rodriguez', 'Radiology', 'DO', 'EN-79636', '+1-617-5374', 'dr.rodriguez@hospita', 112690.00, '11 AM - 1 ', 3000.00, 2, 10),
(11, 'Dr. Brown suza', 'General Surgery', 'PhD', 'EN-21633', '+1-151-3030', 'dr.brown@hospital.co', 108087.00, '4 PM - 6 P', 7000.00, 2, 11),
(12, 'Dr. Johnson suza', 'Psychiatry', 'DO', 'EN-44286', '+1-622-1430', 'dr.johnson@hospital.', 146979.00, '11 AM - 1 ', 9000.00, 3, 12),
(13, 'Dr. Wilson picasha', 'Pediatrics', 'DO', 'EN-83552', '+1-123-8352', 'dr.wilson@hospital.c', 110417.00, '4 PM - 6 P', 3000.00, 2, 10),
(14, 'Dr. Smith picasha', 'Radiology', 'MD', 'EN-71060', '+1-680-3196', 'dr.smith@hospital.co', 136911.00, '2 PM - 4 P', 7000.00, 5, 11),
(15, 'Dr. Williams picasha', 'Orthopedics', 'MD', 'EN-52545', '+1-509-1050', 'dr.williams@hospital', 100564.00, '11 AM - 1 ', 5000.00, 5, 9),
(16, 'Dr. Brown yata', 'Oncology', 'DM', 'EN-77642', '+1-554-6624', 'dr.brown@hospital.co', 148569.00, '9 AM - 11 ', 8000.00, 3, 10),
(17, 'Dr. Miller', 'Neurology', 'MS', 'EN-21011', '+1-980-6267', 'dr.miller@hospital.c', 127662.00, '2 PM - 4 P', 6000.00, 2, 11),
(18, 'Dr. Williams', 'Cardiology', 'DO', 'EN-54190', '+1-401-4285', 'dr.williams@hospital', 80646.00, '2 PM - 4 P', 4000.00, 2, 12),
(19, 'Dr. Jones', 'Dermatology', 'MCh', 'EN-70600', '+1-727-5599', 'dr.jones@hospital.co', 98813.00, '11 AM - 1 ', 2000.00, 3, 12),
(20, 'Dr. Brown', 'Psychiatry', 'MS', 'EN-94235', '+1-650-4037', 'dr.brown@hospital.co', 77376.00, '2 PM - 4 P', 5000.00, 2, 9),
(21, 'Dr. Smith suza', 'Cardiology', 'DNB', 'EN-48034', '+1-822-6104', 'dr.smith@hospital.co', 89055.00, '9 AM - 11 ', 9000.00, 3, 11),
(22, 'Dr. Smith yata', 'Dermatology', 'MCh', 'EN-62373', '+1-804-6196', 'dr.smith@hospital.co', 141979.00, '4 PM - 6 P', 8000.00, 2, 10),
(23, 'Dr. Johnson', 'Gastroenterology', 'MBBS', 'EN-64789', '+1-458-8699', 'dr.johnson@hospital.', 136533.00, '2 PM - 4 P', 7000.00, 4, 12),
(24, 'Dr. Wilson', 'Pediatrics', 'DO', 'EN-38874', '+1-472-8112', 'dr.wilson@hospital.c', 78882.00, '2 PM - 4 P', 3000.00, 5, 11),
(25, 'Dr. Smith', 'General Surgery', 'MD', 'EN-60080', '+1-298-6114', 'dr.smith@hospital.co', 110404.00, '9 AM - 11 ', 6000.00, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `comment` varchar(30) NOT NULL,
  `rating` int(1) NOT NULL,
  `date` date NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `comment`, `rating`, `date`, `patient_id`, `doc_id`) VALUES
(1, 'Very good service', 5, '2024-05-01', 1, 5),
(2, 'Satisfactory', 4, '2024-05-02', 2, 3),
(3, 'Excellent care', 5, '2024-05-03', 3, 8),
(4, 'Not satisfied', 2, '2024-05-04', 4, 10),
(5, 'Friendly staff', 4, '2024-05-05', 5, 12),
(6, 'Quick service', 5, '2024-05-06', 6, 7),
(7, 'Needs improvement', 3, '2024-05-07', 7, 15),
(8, 'Highly recommend', 5, '2024-05-08', 8, 9),
(9, 'Average experience', 3, '2024-05-09', 9, 6),
(10, 'Will visit again', 4, '2024-05-10', 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `labtest`
--

CREATE TABLE `labtest` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` varchar(30) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labtest`
--

INSERT INTO `labtest` (`id`, `name`, `description`, `cost`, `staff_id`) VALUES
(1, 'Blood Test', 'Complete Blood Count', 5000.00, 3),
(2, 'X-Ray', 'Chest X-Ray', 10000.00, 4),
(3, 'MRI', 'Magnetic Resonance Imaging', 50000.00, 5),
(4, 'CT Scan', 'Computed Tomography', 40000.00, 6),
(5, 'Urine Test', 'Urinalysis', 3000.00, 7),
(6, 'ECG', 'Electrocardiogram', 15000.00, 3),
(7, 'Liver Function', 'LFT Panel', 7000.00, 4),
(8, 'Kidney Function', 'KFT Panel', 8000.00, 5),
(9, 'Thyroid Test', 'Thyroid Profile', 6000.00, 6),
(10, 'Lipid Profile', 'Cholesterol Panel', 9000.00, 7),
(11, 'Glucose Test', 'Blood Sugar Level', 4000.00, 3),
(12, 'Allergy Test', 'Immunoglobulin E', 12000.00, 4),
(13, 'Stool Test', 'Ova and Parasites', 5000.00, 5),
(14, 'Sputum Test', 'Respiratory Infection', 7000.00, 6),
(15, 'HIV Test', 'HIV Antibody Test', 10000.00, 7);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `description` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `stock` int(6) NOT NULL,
  `disease_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `description`, `supplier`, `price`, `expiry_date`, `stock`, `disease_id`) VALUES
(1, 'Napa', 'Paracetamol', 'Beximco', 10.00, '2025-01-01', 100, 1),
(2, 'Dexlun', 'Dexlansoprazole', 'Square', 15.50, '2025-02-01', 150, 2),
(3, 'Histacin', 'Cetirizine', 'ACI', 20.00, '2025-03-01', 200, 3),
(4, 'Seclo', 'Omeprazole', 'Square', 25.75, '2025-04-01', 250, 4),
(5, 'Ace', 'Paracetamol', 'Eskayef', 30.00, '2025-05-01', 300, 5),
(6, 'Nexum', 'Esomeprazole', 'Beximco', 35.50, '2025-06-01', 350, 6),
(7, 'Ciprocin', 'Ciprofloxacin', 'Square', 40.00, '2025-07-01', 400, 7),
(8, 'Xinc', 'Zinc', 'ACI', 45.75, '2025-08-01', 450, 8),
(9, 'Azithrocin', 'Azithromycin', 'Square', 50.00, '2025-09-01', 500, 9),
(10, 'Losan', 'Losartan', 'Incepta', 55.50, '2025-10-01', 550, 10),
(11, 'Pantonix', 'Pantoprazole', 'Opsonin', 60.00, '2025-11-01', 600, 11),
(12, 'Amodis', 'Amodiaquine', 'Renata', 65.75, '2025-12-01', 650, 12),
(13, 'Risek', 'Esomeprazole', 'Eskayef', 70.00, '2026-01-01', 700, 13),
(14, 'Telfast', 'Fexofenadine', 'Sanofi', 75.50, '2026-02-01', 750, 14),
(15, 'Montela', 'Montelukast', 'Square', 80.00, '2026-03-01', 800, 15),
(16, 'Voren', 'Diclofenac', 'Beximco', 85.75, '2026-04-01', 850, 1),
(17, 'Neotack', 'Nitrofurantoin', 'ACI', 90.00, '2026-05-01', 900, 2),
(18, 'Maxpro', 'Esomeprazole', 'Square', 95.50, '2026-06-01', 950, 3),
(19, 'Neuro-B', 'Vitamin B', 'Renata', 100.00, '2026-07-01', 1000, 4),
(20, 'Losectil', 'Omeprazole', 'Eskayef', 105.75, '2026-08-01', 1050, 5),
(21, 'Fluclox', 'Flucloxacillin', 'Opsonin', 110.00, '2026-09-01', 1100, 6),
(22, 'Napa Extra', 'Paracetamol', 'Beximco', 115.50, '2026-10-01', 1150, 7),
(23, 'Claricin', 'Clarithromycin', 'ACI', 120.00, '2026-11-01', 1200, 8),
(24, 'Napro-A', 'Naproxen', 'Square', 125.75, '2026-12-01', 1250, 9),
(25, 'Cef-3', 'Cefixime', 'Incepta', 130.00, '2027-01-01', 1300, 10),
(26, 'Zithrin', 'Azithromycin', 'Renata', 135.50, '2027-02-01', 1350, 11),
(27, 'Clonil', 'Clonazepam', 'Opsonin', 140.00, '2027-03-01', 1400, 12),
(28, 'Fexo', 'Fexofenadine', 'Eskayef', 145.75, '2027-04-01', 1450, 13),
(29, 'Levotiz', 'Levocetirizine', 'ACI', 150.00, '2027-05-01', 1500, 14),
(30, 'Neoceptin ', 'Ranitidine', 'Beximco', 155.50, '2027-06-01', 1550, 15);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `qualifications` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `duty_shift` varchar(10) NOT NULL,
  `hospital_salary` decimal(7,2) NOT NULL,
  `patient_cost` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`id`, `name`, `qualifications`, `phone`, `email`, `duty_shift`, `hospital_salary`, `patient_cost`) VALUES
(1, 'Alice Johnson', 'RN, BSN', '555-1010', 'alice.johnson@hospit', 'Day', 60000.00, 500.00),
(2, 'Bob Smith', 'RN', '555-2020', 'bob.smith@hospital.c', 'Night', 58000.00, 480.00),
(3, 'Cathy Brown', 'RN, MSN', '555-3030', 'cathy.brown@hospital', 'Day', 62000.00, 520.00),
(4, 'David Lee', 'RN', '555-4040', 'david.lee@hospital.c', 'Night', 57000.00, 470.00),
(5, 'Eva Green', 'RN, BSN', '555-5050', 'eva.green@hospital.c', 'Day', 60000.00, 500.00),
(6, 'Frank White', 'RN', '555-6060', 'frank.white@hospital', 'Night', 56000.00, 460.00),
(7, 'Grace Black', 'RN, MSN', '555-7070', 'grace.black@hospital', 'Day', 63000.00, 530.00),
(8, 'Hank Blue', 'RN', '555-8080', 'hank.blue@hospital.c', 'Night', 58000.00, 480.00),
(9, 'Ivy Red', 'RN, BSN', '555-9090', 'ivy.red@hospital.com', 'Day', 60000.00, 500.00),
(10, 'Jack Yellow', 'RN', '555-0101', 'jack.yellow@hospital', 'Night', 57000.00, 470.00),
(11, 'Karen Purple', 'RN, MSN', '555-1111', 'karen.purple@hospita', 'Day', 62000.00, 520.00),
(12, 'Larry Pink', 'RN', '555-2222', 'larry.pink@hospital.', 'Night', 56000.00, 460.00),
(13, 'Mona Grey', 'RN, BSN', '555-3333', 'mona.grey@hospital.c', 'Day', 60000.00, 500.00),
(14, 'Nina Silver', 'RN', '555-4444', 'nina.silver@hospital', 'Night', 58000.00, 480.00),
(15, 'Oscar Gold', 'RN, MSN', '555-5555', 'oscar.gold@hospital.', 'Day', 63000.00, 530.00);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `emergency_contact` varchar(15) NOT NULL,
  `medi_history` varchar(30) NOT NULL,
  `room_id` int(11) NOT NULL,
  `ambulance_id` int(11) NOT NULL,
  `admit_date` date NOT NULL,
  `admit_time` time NOT NULL,
  `release_date` date NOT NULL,
  `release_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `gender`, `dob`, `address`, `phone`, `email`, `emergency_contact`, `medi_history`, `room_id`, `ambulance_id`, `admit_date`, `admit_time`, `release_date`, `release_time`) VALUES
(1, 'John Doepicasha', 'Male', '1980-05-14', '123 Main St', '+1-555-1234', 'johndoe@example.com', '+1-555-5678', 'None', 1, 1, '2024-05-10', '10:30:00', '2024-05-15', '09:00:00'),
(2, 'Jane Smithpicasha', 'Female', '1992-11-23', '456 Oak St', '+1-555-2345', 'janesmith@example.co', '+1-555-6789', 'Diabetes', 2, 2, '2024-05-11', '11:00:00', '2024-05-16', '10:00:00'),
(3, 'Alice Johnsonpicasha', 'Female', '1985-07-04', '789 Pine St', '+1-555-3456', 'alicejohnson@example', '+1-555-7890', 'Hypertension', 3, 3, '2024-05-12', '09:00:00', '2024-05-17', '11:00:00'),
(4, 'Robert Brown', 'Male', '1978-12-15', '101 Maple St', '+1-555-4567', 'robertbrown@example.', '+1-555-8901', 'Asthma', 4, 4, '2024-05-13', '08:30:00', '2024-05-18', '12:00:00'),
(5, 'Mary Davis', 'Female', '1990-03-05', '202 Birch St', '+1-555-5678', 'marydavis@example.co', '+1-555-9012', 'None', 5, 5, '2024-05-14', '10:00:00', '2024-05-19', '10:00:00'),
(6, 'James Wilsonpicasha', 'Male', '1983-06-22', '303 Cedar St', '+1-555-6789', 'jameswilson@example.', '+1-555-0123', 'Heart Disease', 6, 6, '2024-05-15', '11:30:00', '2024-05-20', '09:30:00'),
(7, 'Patricia Martinezpicasha', 'Female', '1995-08-30', '404 Spruce St', '+1-555-7890', 'patriciamartinez@exa', '+1-555-1234', 'None', 7, 1, '2024-05-16', '12:00:00', '2024-05-21', '11:00:00'),
(8, 'Michael Anderson', 'Male', '1975-02-18', '505 Willow St', '+1-555-8901', 'michaelanderson@exam', '+1-555-2345', 'Diabetes', 8, 2, '2024-05-17', '09:00:00', '2024-05-22', '10:00:00'),
(9, 'Linda Taylor', 'Female', '1988-09-13', '606 Fir St', '+1-555-9012', 'lindataylor@example.', '+1-555-3456', 'Hypertension', 13, 3, '2024-05-18', '10:30:00', '2024-05-23', '09:00:00'),
(10, 'William Thomas', 'Male', '1981-11-02', '707 Aspen St', '+1-555-0123', 'williamthomas@exampl', '+1-555-4567', 'Asthma', 14, 4, '2024-05-19', '11:00:00', '2024-05-24', '10:00:00'),
(11, 'Elizabeth Lee', 'Female', '1979-04-25', '808 Elm St', '+1-555-1234', 'elizabethlee@example', '+1-555-5678', 'None', 15, 5, '2024-05-20', '12:30:00', '2024-05-25', '11:30:00'),
(12, 'David Harris', 'Male', '1986-07-11', '909 Poplar St', '+1-555-2345', 'davidharris@example.', '+1-555-6789', 'Heart Disease', 16, 6, '2024-05-21', '09:00:00', '2024-05-26', '12:00:00'),
(13, 'Barbara Clarkpicasha', 'Female', '1993-12-05', '1010 Hemlock St', '+1-555-3456', 'barbaraclark@example', '+1-555-7890', 'None', 17, 1, '2024-05-22', '10:30:00', '2024-05-27', '09:30:00'),
(14, 'Charles Lewispicasha', 'Male', '1982-10-28', '1111 Redwood St', '+1-555-4567', 'charleslewis@example', '+1-555-8901', 'Diabetes', 18, 2, '2024-05-23', '11:00:00', '2024-05-28', '10:00:00'),
(15, 'Susan Walkerpicasha', 'Female', '1991-05-20', '1212 Pinecone St', '+1-555-5678', 'susanwalker@example.', '+1-555-9012', 'Hypertension', 19, 3, '2024-05-24', '09:00:00', '2024-05-29', '11:30:00'),
(16, 'Joseph King', 'Male', '1976-08-03', '1313 Acorn St', '+1-555-6789', 'josephking@example.c', '+1-555-0123', 'Asthma', 20, 4, '2024-05-25', '08:30:00', '2024-05-30', '12:00:00'),
(17, 'Karen Scott', 'Female', '1984-06-12', '1414 Berry St', '+1-555-7890', 'karenscott@example.c', '+1-555-1234', 'None', 21, 5, '2024-05-26', '10:00:00', '2024-05-31', '10:00:00'),
(18, 'Thomas Young', 'Male', '1989-03-17', '1515 Clover St', '+1-555-8901', 'thomasyoung@example.', '+1-555-2345', 'Heart Disease', 22, 6, '2024-05-27', '11:30:00', '2024-06-01', '09:30:00'),
(19, 'Nancy Allen', 'Female', '1994-11-08', '1616 Daisy St', '+1-555-9012', 'nancyallen@example.c', '+1-555-3456', 'None', 23, 1, '2024-05-28', '12:00:00', '2024-06-02', '11:00:00'),
(20, 'Daniel Martinez', 'Male', '1980-01-22', '1717 Elmwood St', '+1-555-0123', 'danielmartinez@examp', '+1-555-4567', 'Diabetes', 24, 2, '2024-05-29', '09:00:00', '2024-06-03', '10:00:00'),
(21, 'Betty Hill', 'Female', '1996-04-09', '1818 Fern St', '+1-555-1234', 'bettyhill@example.co', '+1-555-5678', 'Hypertension', 25, 3, '2024-05-30', '10:30:00', '2024-06-04', '09:00:00'),
(22, 'Paul Green', 'Male', '1987-09-14', '1919 Garden St', '+1-555-2345', 'paulgreen@example.co', '+1-555-6789', 'Asthma', 1, 4, '2024-05-31', '11:00:00', '2024-06-05', '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `biller_name` varchar(20) NOT NULL,
  `bill_maker` varchar(20) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `hospital_cost` decimal(7,2) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `receipt_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `biller_name`, `bill_maker`, `patient_id`, `time`, `payment_method`, `hospital_cost`, `discount`, `receipt_number`) VALUES
(1, 'John Doe', 'Cashier1', 1, '2024-05-01 09:00:00', 'Cash', 4500.00, 20.00, 'RCPT001'),
(2, 'Jane Smith', 'Cashier2', 2, '2024-05-01 09:30:00', 'Card', 4700.00, 21.00, 'RCPT002'),
(3, 'Emily Brown', 'Cashier3', 3, '2024-05-01 10:00:00', 'Cash', 4900.00, 22.00, 'RCPT003'),
(4, 'Michael White', 'Cashier1', 4, '2024-05-01 10:30:00', 'Card', 4200.00, 23.00, 'RCPT004'),
(5, 'Sarah Green', 'Cashier2', 5, '2024-05-01 11:00:00', 'Cash', 4100.00, 24.00, 'RCPT005'),
(6, 'David Black', 'Cashier3', 6, '2024-05-01 11:30:00', 'Card', 4800.00, 25.00, 'RCPT006'),
(7, 'Jessica Blue', 'Cashier1', 7, '2024-05-01 12:00:00', 'Cash', 4600.00, 20.00, 'RCPT007'),
(8, 'Daniel Gray', 'Cashier2', 8, '2024-05-01 12:30:00', 'Card', 4300.00, 21.00, 'RCPT008'),
(9, 'Laura Purple', 'Cashier3', 9, '2024-05-01 13:00:00', 'Cash', 5000.00, 22.00, 'RCPT009'),
(10, 'Matthew Red', 'Cashier1', 10, '2024-05-01 13:30:00', 'Card', 4000.00, 23.00, 'RCPT010'),
(11, 'Olivia Yellow', 'Cashier2', 11, '2024-05-01 14:00:00', 'Cash', 4700.00, 24.00, 'RCPT011'),
(12, 'James Orange', 'Cashier3', 12, '2024-05-01 14:30:00', 'Card', 4800.00, 25.00, 'RCPT012'),
(13, 'Sophia Pink', 'Cashier1', 13, '2024-05-01 15:00:00', 'Cash', 4900.00, 20.00, 'RCPT013'),
(14, 'Benjamin Lime', 'Cashier2', 14, '2024-05-01 15:30:00', 'Card', 4200.00, 21.00, 'RCPT014'),
(15, 'Isabella Aqua', 'Cashier3', 15, '2024-05-01 16:00:00', 'Cash', 4100.00, 22.00, 'RCPT015'),
(16, 'Liam Black', 'Cashier1', 16, '2024-05-01 16:30:00', 'Card', 4800.00, 23.00, 'RCPT016'),
(17, 'Mason Blue', 'Cashier2', 17, '2024-05-01 17:00:00', 'Cash', 4600.00, 24.00, 'RCPT017'),
(18, 'Ethan Gray', 'Cashier3', 18, '2024-05-01 17:30:00', 'Card', 4300.00, 25.00, 'RCPT018'),
(19, 'Ava Purple', 'Cashier1', 19, '2024-05-01 18:00:00', 'Cash', 5000.00, 20.00, 'RCPT019'),
(20, 'Charlotte Red', 'Cashier2', 20, '2024-05-01 18:30:00', 'Card', 4000.00, 21.00, 'RCPT020'),
(21, 'Amelia Yellow', 'Cashier3', 21, '2024-05-01 19:00:00', 'Cash', 4700.00, 25.00, 'RCPT021'),
(22, 'Amelia sayem', 'Cashier3', 22, '2024-05-01 19:00:00', 'Cash', 4700.00, 25.00, 'RCPT022');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `location` varchar(20) NOT NULL,
  `room_fare` decimal(7,2) NOT NULL,
  `facilities` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_number`, `type`, `status`, `location`, `room_fare`, `facilities`) VALUES
(1, 'Block A-10', 'AC', 'available', 'Building A, Floor 1', 15000.00, 'TV, WiFi, Private Bathroom'),
(2, 'Block A-10', 'Non-AC', 'available', 'Building A, Floor 1', 10000.00, 'TV, Shared Bathroom'),
(3, 'Block A-10', 'AC', 'unavailabl', 'Building A, Floor 1', 15000.00, 'TV, WiFi, Private Bathroom'),
(4, 'Block A-10', 'Non-AC', 'available', 'Building A, Floor 1', 10000.00, 'TV, Shared Bathroom'),
(5, 'Block B-20', 'AC', 'unavailabl', 'Building B, Floor 2', 20000.00, 'TV, WiFi, Private Bathroom'),
(6, 'Block B-20', 'Non-AC', 'available', 'Building B, Floor 2', 12000.00, 'Shared Bathroom'),
(7, 'Block B-20', 'AC', 'available', 'Building B, Floor 2', 20000.00, 'TV, WiFi, Private Bathroom'),
(8, 'Block B-20', 'Non-AC', 'unavailabl', 'Building B, Floor 2', 12000.00, 'Shared Bathroom'),
(9, 'Block C-30', 'For Doctor', 'blocked', 'Building C, Floor 3', 0.00, 'TV, WiFi, Kitchenette'),
(10, 'Block C-30', 'For Doctor', 'blocked', 'Building C, Floor 3', 0.00, 'TV, WiFi, Kitchenette'),
(11, 'Block C-30', 'For Doctor', 'blocked', 'Building C, Floor 3', 0.00, 'TV, WiFi, Kitchenette'),
(12, 'Block C-30', 'For Doctor', 'blocked', 'Building C, Floor 3', 0.00, 'TV, WiFi, Kitchenette'),
(13, 'Block D-40', 'AC', 'unavailabl', 'Building D, Floor 4', 18000.00, 'TV, WiFi, Private Bathroom'),
(14, 'Block D-40', 'Non-AC', 'available', 'Building D, Floor 4', 13000.00, 'TV, Shared Bathroom'),
(15, 'Block D-40', 'AC', 'available', 'Building D, Floor 4', 18000.00, 'TV, WiFi, Private Bathroom'),
(16, 'Block D-40', 'Non-AC', 'unavailabl', 'Building D, Floor 4', 13000.00, 'TV, Shared Bathroom'),
(17, 'Block E-50', 'AC', 'available', 'Building E, Floor 5', 16000.00, 'TV, WiFi, Private Bathroom'),
(18, 'Block E-50', 'Non-AC', 'unavailabl', 'Building E, Floor 5', 11000.00, 'Shared Bathroom'),
(19, 'Block E-50', 'AC', 'available', 'Building E, Floor 5', 16000.00, 'TV, WiFi, Private Bathroom'),
(20, 'Block E-50', 'Non-AC', 'available', 'Building E, Floor 5', 11000.00, 'Shared Bathroom'),
(21, 'Block F-60', 'AC', 'available', 'Building F, Floor 6', 17000.00, 'TV, WiFi, Private Bathroom'),
(22, 'Block F-60', 'Non-AC', 'unavailabl', 'Building F, Floor 6', 12000.00, 'Shared Bathroom'),
(23, 'Block F-60', 'AC', 'unavailabl', 'Building F, Floor 6', 17000.00, 'TV, WiFi, Private Bathroom'),
(24, 'Block F-60', 'Non-AC', 'available', 'Building F, Floor 6', 12000.00, 'Shared Bathroom'),
(25, 'Block G-70', 'AC', 'available', 'Building G, Floor 7', 18000.00, 'TV, WiFi, Private Bathroom');

-- --------------------------------------------------------

--
-- Table structure for table `sec_pat_dia`
--

CREATE TABLE `sec_pat_dia` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sec_pat_dia`
--

INSERT INTO `sec_pat_dia` (`id`, `patient_id`, `disease_id`) VALUES
(1, 17, 7),
(2, 2, 14),
(3, 5, 8),
(4, 16, 2),
(5, 8, 7),
(6, 6, 14),
(7, 19, 8),
(8, 1, 10),
(9, 22, 1),
(10, 5, 14),
(11, 18, 7),
(12, 15, 1),
(13, 8, 8),
(14, 11, 12),
(15, 14, 9),
(16, 5, 4),
(17, 15, 9),
(18, 19, 7),
(19, 19, 11),
(20, 2, 4),
(21, 22, 4),
(22, 4, 1),
(23, 17, 9),
(24, 15, 8),
(25, 15, 13),
(26, 1, 11),
(27, 11, 4),
(28, 15, 11),
(29, 12, 9),
(30, 7, 11),
(31, 17, 8),
(32, 5, 9),
(33, 4, 4),
(34, 15, 8),
(35, 12, 4),
(36, 9, 7),
(37, 19, 1),
(38, 14, 14),
(39, 18, 3),
(40, 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sec_pat_doc`
--

CREATE TABLE `sec_pat_doc` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sec_pat_doc`
--

INSERT INTO `sec_pat_doc` (`id`, `patient_id`, `doctor_id`) VALUES
(1, 14, 22),
(2, 13, 7),
(3, 14, 7),
(4, 9, 5),
(5, 19, 15),
(6, 11, 14),
(7, 7, 23),
(8, 14, 9),
(9, 20, 12),
(10, 15, 22),
(11, 8, 1),
(12, 5, 22),
(13, 16, 25),
(14, 18, 25),
(15, 14, 4),
(16, 18, 16),
(17, 16, 19),
(18, 11, 6),
(19, 14, 12),
(20, 10, 22),
(21, 1, 12),
(22, 6, 21),
(23, 10, 16),
(24, 18, 3),
(25, 5, 16),
(26, 11, 16),
(27, 14, 6),
(28, 4, 8),
(29, 21, 18),
(30, 16, 10),
(31, 20, 6),
(32, 11, 20),
(33, 12, 4),
(34, 3, 3),
(35, 7, 2),
(36, 12, 10),
(37, 9, 19),
(38, 11, 8),
(39, 1, 6),
(40, 22, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sec_pat_lab`
--

CREATE TABLE `sec_pat_lab` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sec_pat_lab`
--

INSERT INTO `sec_pat_lab` (`id`, `patient_id`, `lab_id`) VALUES
(1, 10, 9),
(2, 10, 9),
(3, 14, 6),
(4, 19, 3),
(5, 9, 5),
(6, 10, 3),
(7, 13, 7),
(8, 8, 7),
(9, 5, 12),
(10, 2, 1),
(11, 2, 3),
(12, 14, 9),
(13, 1, 7),
(14, 4, 8),
(15, 22, 6),
(16, 22, 11),
(17, 11, 7),
(18, 16, 3),
(19, 18, 8),
(20, 4, 3),
(21, 7, 2),
(22, 13, 10),
(23, 9, 15),
(24, 15, 7),
(25, 3, 4),
(26, 21, 15),
(27, 20, 10),
(28, 13, 15),
(29, 4, 12),
(30, 8, 7),
(31, 1, 15),
(32, 15, 6),
(33, 1, 14),
(34, 8, 2),
(35, 12, 6),
(36, 3, 8),
(37, 4, 6),
(38, 9, 12),
(39, 16, 5),
(40, 7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sec_pat_med`
--

CREATE TABLE `sec_pat_med` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sec_pat_med`
--

INSERT INTO `sec_pat_med` (`id`, `patient_id`, `medice_id`) VALUES
(1, 14, 12),
(2, 1, 28),
(3, 13, 30),
(4, 8, 19),
(5, 5, 3),
(6, 17, 20),
(7, 21, 22),
(8, 19, 29),
(9, 5, 7),
(10, 11, 24),
(11, 9, 22),
(12, 8, 17),
(13, 16, 26),
(14, 4, 8),
(15, 18, 6),
(16, 14, 14),
(17, 9, 16),
(18, 12, 3),
(19, 19, 28),
(20, 1, 14),
(21, 2, 4),
(22, 6, 1),
(23, 5, 4),
(24, 19, 28),
(25, 1, 12),
(26, 19, 4),
(27, 22, 18),
(28, 22, 4),
(29, 15, 26),
(30, 10, 14),
(31, 2, 29),
(32, 11, 19),
(33, 13, 1),
(34, 8, 24),
(35, 18, 18),
(36, 15, 12),
(37, 2, 3),
(38, 6, 3),
(39, 13, 21),
(40, 16, 14);

-- --------------------------------------------------------

--
-- Table structure for table `sec_pat_nur`
--

CREATE TABLE `sec_pat_nur` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `total_shift` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sec_pat_nur`
--

INSERT INTO `sec_pat_nur` (`id`, `patient_id`, `nurse_id`, `total_shift`) VALUES
(1, 22, 13, 1),
(2, 15, 11, 2),
(3, 7, 2, 2),
(4, 21, 6, 1),
(5, 10, 12, 3),
(6, 12, 15, 1),
(7, 7, 11, 4),
(8, 14, 12, 1),
(9, 22, 10, 2),
(10, 21, 8, 4),
(11, 6, 15, 1),
(12, 5, 14, 1),
(13, 8, 11, 2),
(14, 14, 3, 4),
(15, 8, 11, 3),
(16, 2, 5, 2),
(17, 3, 5, 1),
(18, 18, 9, 3),
(19, 20, 13, 3),
(20, 14, 3, 1),
(21, 17, 10, 4),
(22, 14, 6, 4),
(23, 14, 5, 3),
(24, 6, 7, 2),
(25, 1, 7, 1),
(26, 2, 1, 1),
(27, 1, 2, 3),
(28, 6, 10, 2),
(29, 9, 10, 4),
(30, 9, 6, 4),
(31, 22, 8, 2),
(32, 13, 12, 4),
(33, 7, 11, 3),
(34, 2, 6, 3),
(35, 9, 13, 4),
(36, 9, 15, 3),
(37, 2, 11, 1),
(38, 12, 5, 4),
(39, 20, 7, 3),
(40, 4, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `hospital_salary` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `role`, `phone`, `email`, `hospital_salary`) VALUES
(1, 'John Doe', 'admin', '555-1234', 'john.doe@hospital.co', 50000.00),
(2, 'Jane Smith', 'admin', '555-2345', 'jane.smith@hospital.', 45000.00),
(3, 'Jim Brown', 'technician', '555-3456', 'jim.brown@hospital.c', 35000.00),
(4, 'Anna White', 'technician', '555-4567', 'anna.white@hospital.', 40000.00),
(5, 'Mark Green', 'technician', '555-5678', 'mark.green@hospital.', 30000.00),
(6, 'Lisa Black', 'technician', '555-6789', 'lisa.black@hospital.', 45000.00),
(7, 'Paul Blue', 'technician', '555-7890', 'paul.blue@hospital.c', 50000.00),
(8, 'Emily Red', 'cleaner', '555-8901', 'emily.red@hospital.c', 40000.00),
(9, 'David Gray', 'cleaner', '555-9012', 'david.gray@hospital.', 35000.00),
(10, 'Susan Brown', 'driver', '555-0123', 'susan.brown@hospital', 30000.00),
(11, 'James Gold', 'driver', '555-1235', 'james.gold@hospital.', 45000.00),
(12, 'Nancy Silver', 'driver', '555-2346', 'nancy.silver@hospita', 40000.00),
(13, 'Michael White', 'driver', '555-3457', 'michael.white@hospit', 50000.00),
(14, 'Karen Yellow', 'driver', '555-4568', 'karen.yellow@hospita', 35000.00),
(15, 'Robert Green', 'driver', '555-5679', 'robert.green@hospita', 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `relation` varchar(10) NOT NULL,
  `time` datetime NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `name`, `contact`, `relation`, `time`, `patient_id`) VALUES
(1, 'John Doe', '01234567890', 'Friend', '2024-06-01 10:00:00', 3),
(2, 'Jane Smith', '09876543210', 'Sibling', '2024-06-01 11:30:00', 5),
(3, 'Emily Brown', '01987654321', 'Parent', '2024-06-01 13:00:00', 1),
(4, 'Michael White', '01765432109', 'Spouse', '2024-06-01 14:45:00', 8),
(5, 'Sarah Green', '01876543212', 'Friend', '2024-06-02 09:15:00', 7),
(6, 'David Black', '01654321098', 'Parent', '2024-06-02 10:30:00', 2),
(7, 'Jessica Blue', '01432109876', 'Sibling', '2024-06-02 11:45:00', 9),
(8, 'Daniel Gray', '01321098765', 'Spouse', '2024-06-02 13:30:00', 6),
(9, 'Laura Purple', '01543210987', 'Friend', '2024-06-02 15:00:00', 11),
(10, 'Matthew Red', '01209876543', 'Parent', '2024-06-03 10:15:00', 4),
(11, 'Olivia Yellow', '01198765432', 'Sibling', '2024-06-03 11:30:00', 10),
(12, 'James Orange', '01823456789', 'Spouse', '2024-06-03 13:45:00', 15),
(13, 'Sophia Pink', '01712345678', 'Friend', '2024-06-03 15:00:00', 13),
(14, 'Benjamin Lime', '01698712345', 'Parent', '2024-06-04 09:00:00', 14),
(15, 'Isabella Aqua', '01567891234', 'Sibling', '2024-06-04 10:30:00', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `labtest`
--
ALTER TABLE `labtest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disease_id` (`disease_id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `ambulance_id` (`ambulance_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sec_pat_dia`
--
ALTER TABLE `sec_pat_dia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disease_id` (`disease_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `sec_pat_doc`
--
ALTER TABLE `sec_pat_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `sec_pat_lab`
--
ALTER TABLE `sec_pat_lab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_id` (`lab_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `sec_pat_med`
--
ALTER TABLE `sec_pat_med`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medice_id` (`medice_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `sec_pat_nur`
--
ALTER TABLE `sec_pat_nur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurse_id` (`nurse_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambulance`
--
ALTER TABLE `ambulance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `labtest`
--
ALTER TABLE `labtest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sec_pat_dia`
--
ALTER TABLE `sec_pat_dia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sec_pat_doc`
--
ALTER TABLE `sec_pat_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sec_pat_lab`
--
ALTER TABLE `sec_pat_lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sec_pat_med`
--
ALTER TABLE `sec_pat_med`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sec_pat_nur`
--
ALTER TABLE `sec_pat_nur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD CONSTRAINT `ambulance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `disease`
--
ALTER TABLE `disease`
  ADD CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `labtest`
--
ALTER TABLE `labtest`
  ADD CONSTRAINT `labtest_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulance` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `sec_pat_dia`
--
ALTER TABLE `sec_pat_dia`
  ADD CONSTRAINT `sec_pat_dia_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  ADD CONSTRAINT `sec_pat_dia_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `sec_pat_doc`
--
ALTER TABLE `sec_pat_doc`
  ADD CONSTRAINT `sec_pat_doc_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `sec_pat_doc_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `sec_pat_lab`
--
ALTER TABLE `sec_pat_lab`
  ADD CONSTRAINT `sec_pat_lab_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `labtest` (`id`),
  ADD CONSTRAINT `sec_pat_lab_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `sec_pat_med`
--
ALTER TABLE `sec_pat_med`
  ADD CONSTRAINT `sec_pat_med_ibfk_2` FOREIGN KEY (`medice_id`) REFERENCES `medicine` (`id`),
  ADD CONSTRAINT `sec_pat_med_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `sec_pat_nur`
--
ALTER TABLE `sec_pat_nur`
  ADD CONSTRAINT `sec_pat_nur_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`id`),
  ADD CONSTRAINT `sec_pat_nur_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `visitor`
--
ALTER TABLE `visitor`
  ADD CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
