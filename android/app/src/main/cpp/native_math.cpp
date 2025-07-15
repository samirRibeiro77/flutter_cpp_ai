#include <jni.h>

extern "C" JNIEXPORT jint JNICALL
Java_com_samir_1ribeiro_flutter_1cpp_1ai_MainActivity_nativeAdd(
        JNIEnv* env, jobject thiz, jint x, jint y) {
    return x + y;
}