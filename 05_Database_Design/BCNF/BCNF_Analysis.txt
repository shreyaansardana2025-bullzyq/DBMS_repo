# BCNF Analysis – Student, Course and Hobby

## Problem

Consider the relation:

`R(Student, Course, Hobby)`

Sample data:

| Student | Course | Hobby |
|---|---|---|
| Anu | Maths | Painting |
| Anu | Maths | Singing |
| Anu | Physics | Painting |
| Anu | Physics | Singing |
| Ravi | Chemistry | Dancing |

### Business Rules

- A student's courses are independent of their hobbies.
- A student's hobbies are independent of their courses.

## Analysis

The independent relationships can be represented using multivalued dependencies:

- `Student ->> Course`
- `Student ->> Hobby`

For each student, the set of courses and the set of hobbies are independent.

## BCNF Check

BCNF requires that for every non-trivial functional dependency `X -> Y`, `X` is a superkey.

In this relation, the stated business rules are **multivalued dependencies**, not functional dependencies. Therefore, the given rules by themselves do not introduce a non-trivial functional dependency that violates BCNF.

So, strictly speaking, the relation can satisfy **BCNF with respect to functional dependencies**.

## 4NF Observation

The more precise normal-form issue here is **Fourth Normal Form (4NF)**. A non-trivial multivalued dependency `Student ->> Course` (and equivalently `Student ->> Hobby`) exists where `Student` is not a superkey of the full relation.

The relation can therefore be decomposed into:

- `Student_Course(Student, Course)`
- `Student_Hobby(Student, Hobby)`

This decomposition removes the independent multi-valued facts from the same relation and avoids unnecessary combinations of courses and hobbies.

## Conclusion

The example demonstrates an important distinction:

- **BCNF** deals with non-trivial functional dependencies.
- **4NF** additionally handles non-trivial multivalued dependencies.
- For the Student–Course–Hobby example, the key issue is therefore a **4NF violation rather than a BCNF violation**.

This analysis is included as supplementary database-design work and is not presented as an official course assessment.
