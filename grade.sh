CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

set -e
for files in $files
do
    if [[ ! -f $file ]] || [[ $file != ListExamples.java ]]
    then
        echo 'wrong file provide ListExamples.java!'
    fi
done

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

cd grading-area
javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java
java -cp ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
