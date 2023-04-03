#include <stdio.h>
#include <fcgi_stdio.h>

int main(void) {
    while (FCGI_Accept() >= 0) {
        printf(
            "Content-type: text/html\r\n"
            "\r\n"
            "<title>Hello World!</title>"
            "<p>Hello World!</p>"
        );
    }
    return 0;
}