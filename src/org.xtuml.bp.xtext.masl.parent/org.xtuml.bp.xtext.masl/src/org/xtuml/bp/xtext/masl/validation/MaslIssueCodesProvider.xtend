package org.xtuml.bp.xtext.masl.validation

import com.google.common.collect.ImmutableMap
import com.google.inject.Singleton
import java.util.Map
import org.eclipse.xtext.preferences.PreferenceKey
import org.eclipse.xtext.util.IAcceptor
import org.eclipse.xtext.validation.ConfigurableIssueCodesProvider

import static org.eclipse.xtext.validation.SeverityConverter.*

@Singleton
class MaslIssueCodesProvider extends ConfigurableIssueCodesProvider {
	
	static val PREFIX = MaslIssueCodesProvider.name + '.'
	
	public static val ILLEGAL_EMPTY_LIST = PREFIX + 'illegalEmptyList'
	public static val INCONSISTENT_RELATIONSHIP_ENDS = PREFIX + 'inconsistentRelationshipEnds' 
	public static val INCONSISTENT_RELATIONSHIP_NAVIGATION = PREFIX + 'inconsistentRelationshipNavigation' 
	public static val DUPLICATE_NAME = PREFIX + 'duplicateName' 
	public static val CYCLIC_INHERITANCE = PREFIX + 'cyclicInheritance'
	public static val MISSING_DEFINITION = PREFIX + 'missingDefinition' 
	public static val MISSING_DECLARATION = PREFIX + 'missingDeclaration' 
	public static val WRONG_TYPE = PREFIX + 'wrongType'
	public static val INVALID_OPERATION_CALL = PREFIX + 'invalidOperationCall'
	public static val INVALID_FEATURE_CALL = PREFIX + 'invalidFeatureCall'
	public static val WRONG_STRUCTURE = PREFIX + 'wrongStructure'
	public static val NAMING_CONVENTION = PREFIX + 'wrongStructure'
	public static val INVALID_THIS = PREFIX + 'invalidThis'
	
	Map<String, PreferenceKey> issueCodes
	
	new() {
		val map = newLinkedHashMap 
		initialize[map.put(id, it)] 
		this.issueCodes=ImmutableMap.copyOf(map) 
	}
	
	override Map<String, PreferenceKey> getConfigurableIssueCodes() {
		issueCodes
	}

	private def initialize(IAcceptor<PreferenceKey> it) {
		add(ILLEGAL_EMPTY_LIST, SEVERITY_ERROR)
		add(INCONSISTENT_RELATIONSHIP_ENDS, SEVERITY_ERROR) 
		add(INCONSISTENT_RELATIONSHIP_NAVIGATION, SEVERITY_ERROR) 
		add(DUPLICATE_NAME, SEVERITY_ERROR) 
		add(CYCLIC_INHERITANCE, SEVERITY_ERROR)
		add(MISSING_DEFINITION, SEVERITY_WARNING) 
		add(MISSING_DECLARATION, SEVERITY_WARNING) 
		add(WRONG_TYPE, SEVERITY_ERROR)
		add(INVALID_OPERATION_CALL, SEVERITY_ERROR)
		add(INVALID_FEATURE_CALL, SEVERITY_ERROR)
		add(WRONG_STRUCTURE, SEVERITY_WARNING)
		add(NAMING_CONVENTION, SEVERITY_WARNING)
		add(INVALID_THIS, SEVERITY_ERROR)
	}
	
	private def add(IAcceptor<PreferenceKey> it, String issueCode, String defaultSeverity) {
		accept(new PreferenceKey(issueCode, defaultSeverity))
	}
}