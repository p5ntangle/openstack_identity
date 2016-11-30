#!/bin/sh

# setup secure random config, helps to increase load time.


sed -i 's/^securerandom.strongAlgorithms=NativePRNGBlocking:SUN/securerandom.strongAlgorithms=NativePRNGNonBlocking:SUN/' /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security
sed -i 's/^securerandom.strongAlgorithms=NativePRNGBlocking:SUN/securerandom.strongAlgorithms=NativePRNGNonBlocking:SUN/' /etc/java-8-openjdk/security/java.security

