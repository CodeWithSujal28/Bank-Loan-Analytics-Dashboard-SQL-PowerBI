-- PART 2 — Business Questions using SQL

-- Q1. What is the total number of loan applications and total loan amount?

SELECT
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_loan_amount
FROM financial_loan;

-- Q2. How much loan amount has been received back?

SELECT
    SUM(total_payment) AS total_payment
FROM financial_loan;

-- Q3. What is the difference between loan amount and total payment?

SELECT
    SUM(loan_amount) AS total_loan_amount,
    SUM(total_payment) AS total_payment,
    SUM(total_payment) - SUM(loan_amount) AS payment_difference
FROM financial_loan;

-- Q4. Which loan grades have the highest number of charged-off loans?

SELECT
    grade,
    COUNT(*) AS charged_off_loans
FROM financial_loan
WHERE loan_status = 'Charged Off'
GROUP BY grade
ORDER BY charged_off_loans DESC;

-- Q5. Which states have the highest loan amount?

SELECT
    address_state,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount
FROM financial_loan
GROUP BY address_state
ORDER BY total_loan_amount DESC;

-- Q6. Which states have the highest charged-off amount?

SELECT
    address_state,
    COUNT(*) AS charged_off_loans,
    SUM(loan_amount) AS charged_off_amount
FROM financial_loan
WHERE loan_status = 'Charged Off'
GROUP BY address_state
ORDER BY charged_off_amount DESC;

-- Q7. Which loan grades have the highest average interest rate?

SELECT
    grade,
    COUNT(*) AS total_loans,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM financial_loan
GROUP BY grade
ORDER BY avg_interest_rate DESC;

-- Q8. How has the loan portfolio changed month by month?

SELECT
    DATE_TRUNC('month', issue_date) AS month,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    SUM(total_payment) AS total_payment
FROM financial_loan
GROUP BY month
ORDER BY month;

-- Q9. What is the average DTI for different loan grades?

SELECT
    grade,
    ROUND(AVG(dti) * 100, 2) AS avg_dti
FROM financial_loan
GROUP BY grade
ORDER BY avg_dti DESC;

-- Q10. Which loan grades have the highest total charged-off amount?

SELECT
    grade,
    COUNT(*) AS charged_off_loans,
    SUM(loan_amount) AS charged_off_amount
FROM financial_loan
WHERE loan_status = 'Charged Off'
GROUP BY grade
ORDER BY charged_off_amount DESC;

-- Q11. What percentage of loans are Good, Bad and Current?

SELECT
    CASE
        WHEN loan_status = 'Fully Paid' THEN 'Good Loan'
        WHEN loan_status = 'Charged Off' THEN 'Bad Loan'
        ELSE 'Current'
    END AS loan_category,
    COUNT(*) AS total_loans,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM financial_loan),2) AS loan_percentage
FROM financial_loan
GROUP BY loan_category
ORDER BY total_loans DESC;

-- Q12. Which loan grades have the highest bad-loan rate?

SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_loan_rate
FROM financial_loan
GROUP BY grade
ORDER BY bad_loan_rate DESC;

-- Q13. Which loan purposes have the highest bad-loan rate?

SELECT
    purpose,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_loan_rate
FROM financial_loan
GROUP BY purpose
ORDER BY bad_loan_rate DESC;

-- Q14. Does loan term affect the bad-loan rate?

SELECT
    term,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_loan_rate
FROM financial_loan
GROUP BY term
ORDER BY bad_loan_rate DESC;

-- Q15. Does verification status affect the bad-loan rate?

SELECT
    verification_status,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_loan_rate
FROM financial_loan
GROUP BY verification_status
ORDER BY bad_loan_rate DESC;

