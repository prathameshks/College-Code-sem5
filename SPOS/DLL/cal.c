#include <jni.h>

JNIEXPORT jint JNICALL Java_cal_add (JNIEnv *env, jobject obj, jint a, jint b){
  return a+b;
}

// Command to run
// gcc -shared -I $JAVA_HOME/include/ -I $JAVA_HOME/include/linux/ -o libcal.so cal.c

