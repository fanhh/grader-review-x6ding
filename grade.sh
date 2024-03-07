CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests


if [ -f "student-submission/ListExamples.java" ]; 
then
  echo "File exists"
else
    echo "ListExamples.java does not exist"
    exit 1
fi

# jars
cp -r lib grading-area

# ListExamples
cp student-submission/ListExamples.java grading-area/


# TestListExamples
cp TestListExamples.java grading-area/


# Compile
javac -cp $CPATH grading-area/*.java

if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
else
    echo "Compilation successful"
fi

# Run
cd grading-area
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples


if [ $? -ne 0 ]; then
    echo "Tests failed"
    exit 1
else
    echo "Tests passed"
    exit 0
fi

