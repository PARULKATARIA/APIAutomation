package io.swagger.petstore.karate;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class KarateFeatureRunner {

	private static final String targetDir = "build/reports/karate-reports";

	@Test
	public void testParallelFeatures() {
		String path = "classpath:io/swagger/petstore/karate/features";
		Results results = Runner.path(path).outputCucumberJson(true).reportDir(targetDir).parallel(5);
		generateReport(results.getReportDir());
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File(targetDir), "RestAPIAutomation");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}
}