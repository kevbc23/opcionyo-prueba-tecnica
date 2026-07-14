import com.intuit.karate.junit5.Karate;

class AuthTest {

    @Karate.Test
    Karate testAllFeatures() {
        return Karate.run("classpath:features")
                .relativeTo(getClass());
    }
}