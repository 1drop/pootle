UPDATE pootle_app_project
SET description = '<h3>Good to know!</h3>
<p>In new versions of TYPO3 some language files have been moved. They still are in the same extension like they were before, but now they are duplicated as <tt>locallang.#######.xlf</tt> at the project\'s root.</p>
<p>You do <b>not</b> have to translate these files again. Instead, take a translated version of the old file and use the “Upload file” interface in the project view, to upload the translations.</p>
<p>That way all fitting translations will be inserted automatically.</p>'
WHERE `code` LIKE 'TYPO3.core.%';

UPDATE pootle_app_translationproject
SET description = '<h3>Good to know!</h3>
<p>In new versions of TYPO3 some language files have been moved. They still are in the same extension like they were before, but now they are duplicated as <tt>locallang.#######.xlf</tt> at the project\'s root.</p>
<p>You do <b>not</b> have to translate these files again. Instead, take a translated version of the old file and use the “Upload file” interface in the project view, to upload the translations.</p>
<p>That way all fitting translations will be inserted automatically.</p>'
WHERE project_id IN (
	SELECT id FROM pootle_app_project WHERE `code` LIKE 'TYPO3.core.%'
);