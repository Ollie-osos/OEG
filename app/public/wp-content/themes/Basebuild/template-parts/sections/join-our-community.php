<?php 
$title = get_sub_field('title');
$content = get_sub_field('content');

?>


<!--Zoho Campaigns Web-Optin Form Starts Here-->
<script type="text/javascript" src="https://giay-zcmp.maillist-manage.eu/js/optin.min.js" onload="setupSF('sf3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44','ZCFORMVIEW',false,'light',false,'0')"></script>
<script type="text/javascript">
	function runOnFormSubmit_sf3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44(th){
		/*Before submit, if you want to trigger your event, "include your code here"*/
	};
</script>

<meta content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<div id="sf3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44" data-type="signupform">
	<div id="customForm">
		<input type="hidden" id="recapTheme" value="0">
		<input type="hidden" id="isRecapIntegDone" value="false">
		<input type="hidden" id="recapMode" value="143404000000478017">
		<input type="hidden" id="signupFormType" value="LargeForm_Vertical">
		<div name="SIGNUP_PAGE" id="SIGNUP_PAGE" class="SIGNUP_PAGE large_form_10_css">
			<div>
				<div name="" changeid="" changename="">
					<div id="imgBlock" name="LOGO_DIV" logo="true"></div>
				</div>
				<br>
				<div id="signupMainDiv" name="SIGNUPFORM" changeid="SIGNUPFORM" changename="SIGNUPFORM">
					<div>
						<div style="position:relative;">
							<div id="Zc_SignupSuccess" style="display:none;position:absolute;margin-left:4%;width:90%;background-color: white; padding: 3px; border: 3px solid rgb(194, 225, 154);  margin-top: 10px;margin-bottom:10px;word-break:break-all ">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tbody>
										<tr>
											<td width="10%">
												<img class="successicon" src="https://giay-zcmp.maillist-manage.eu/images/challangeiconenable.jpg" align="absmiddle">
											</td>
											<td>
												<span id="signupSuccessMsg" style="color: rgb(73, 140, 132); font-family: sans-serif; font-size: 14px;word-break:break-word">&nbsp;&nbsp;Thank you for Signing Up</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<form method="POST" id="zcampaignOptinForm" action="https://giay-zcmp.maillist-manage.eu/weboptin.zc" target="_zcSignup">
							<div id="SIGNUP_BODY_ALL" name="SIGNUP_BODY_ALL">
								<h1 id="SIGNUP_HEADING" name="SIGNUP_HEADING" changeid="SIGNUP_MSG" changetype="SIGNUP_HEADER"></h1>
								<div id="SIGNUP_BODY" name="SIGNUP_BODY">
									<div>
										<div class="" changeid="SIGNUP_MSG" id="SIGNUP_DESCRIPTION" changetype="SIGNUP_DESCRIPTION"></div>
										<div id="errorMsgDiv">&nbsp;&nbsp;Please correct the marked field(s) below.</div>
										<div>
											<div name="fieldsdivSf" class="zcsffieldsdiv">
												<div class="zcsffield " fieldid="143404000000000019">
													<div>
														<div name="SIGNUP_FORM_LABEL">First Name&nbsp;
															
															
															<span name="SIGNUP_REQUIRED">*</span>
														
														
														</div>
														<div><!-- check to mark emailid field as type email, and other mandatory fields as type required -->
															<input name="FIRSTNAME" changeitem="SIGNUP_FORM_FIELD" maxlength="100" type="text" required="true" value="">
															<span style="display:none" id="dt_FIRSTNAME">1,true,1,First Name,2</span>
														</div>
													</div>
													
													
													
													
											<div></div>
												
												
												
												</div>
												<div class="zcsffield " fieldid="143404000000000021">
													<div>
														<div name="SIGNUP_FORM_LABEL">Last Name&nbsp;<span name="SIGNUP_REQUIRED">*</span></div>
														<div><!-- check to mark emailid field as type email, and other mandatory fields as type required -->
															<input name="LASTNAME" changeitem="SIGNUP_FORM_FIELD" maxlength="100" type="text" required="true" value="">
															<span style="display:none" id="dt_LASTNAME">1,true,1,Last Name,2</span>
														</div>
													</div><div></div></div>
												<div class="zcsffield " fieldid="143404000000000015">
													<div>
														<div name="SIGNUP_FORM_LABEL">Contact Email&nbsp;<span name="SIGNUP_REQUIRED">*</span></div>
														<div><!-- check to mark emailid field as type email, and other mandatory fields as type required -->
															<input name="CONTACT_EMAIL" changeitem="SIGNUP_FORM_FIELD" maxlength="100" type="email" required="true" value="">
															<span style="display:none" id="dt_CONTACT_EMAIL">1,true,6,Contact Email,2</span>
														</div>
													</div><div></div></div>
												<div class="zcsffield " fieldid="143404000000767342">
													<div>
														<div>
															<div name="SIGNUP_FORM_LABEL">Where Did You Hear About Us?&nbsp;</div>
															<select name="CONTACT_CF12" changeitem="SIGNUP_FORM_FIELD" multiple="multiple" zc_display_name="Where Did You Hear About Us?">
																<option value="Social Media">Social Media</option>
																<option value="Google">Google</option>
																<option value="Podcast">Podcast</option>
																<option value="Recommendation">Recommendation</option>
																<option value="Other">Other</option>
															</select>&nbsp;
															<span style="display:none" id="dt_CONTACT_CF12">1,false,13,Where Did You Hear About Us?,2</span>
														</div>
													</div><div></div></div>
											</div><!-- Captcha for Signup -->
											<div class="recapDivlight recaptcha" id="recapDiv"></div>
											<input type="hidden" id="secretid" value="6LdNeDUUAAAAAG5l7cJfv1AA5OKLslkrOa_xXxLs"><!-- Captcha for Signup End--><!-- Other Lists Subscription Start--><!-- Other Lists Subscription End--><div></div>
											<div id="REQUIRED_FIELD_TEXT" changetype="REQUIRED_FIELD_TEXT" name="SIGNUP_REQUIRED">*Required Fields</div>
											<div>
												<input type="button" action="Save" id="zcWebOptin" name="SIGNUP_SUBMIT_BUTTON" changetype="SIGNUP_SUBMIT_BUTTON_TEXT" value="SUBSCRIBE">
											</div><!-- Do not edit the below Zoho Campaigns hidden tags -->
											<input type="hidden" id="fieldBorder" value="">
											<input type="hidden" name="zc_trackCode" id="zc_trackCode" value="ZCFORMVIEW" onload="">
											<input type="hidden" name="viewFrom" id="viewFrom" value="URL_ACTION">
											<input type="hidden" id="submitType" name="submitType" value="optinCustomView">
											<input type="hidden" id="lD" name="lD" value="11fd792d9f6c564a">
											<input type="hidden" name="emailReportId" id="emailReportId" value="">
											<input type="hidden" name="zx" id="cmpZuid" value="14ad9af572">
											<input type="hidden" name="zcvers" value="2.0">
											<input type="hidden" name="oldListIds" id="allCheckedListIds" value="">
											<input type="hidden" id="mode" name="mode" value="OptinCreateView">
											<input type="hidden" id="zcld" name="zcld" value="11fd792d9f6c564a">
											<input type="hidden" id="zctd" name="zctd" value="11fd792d9f5f2d6f">
											<input type="hidden" id="document_domain" value="">
											<input type="hidden" id="zc_Url" value="giay-zcmp.maillist-manage.eu">
											<input type="hidden" id="new_optin_response_in" value="0">
											<input type="hidden" id="duplicate_optin_response_in" value="0">
											<input type="hidden" id="zc_formIx" name="zc_formIx" value="3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44"><!-- End of the campaigns hidden tags --></div>
									</div>
									<input type="hidden" id="isCaptchaNeeded" value="true">
									<input type="hidden" id="superAdminCap" value="0">
									<img src="https://giay-zcmp.maillist-manage.eu/images/spacer.gif" onload="referenceSetter(this)" id="refImage">
								</div>
								<div id="privacyNotes" identity="privacyNotes">
									<span>Note: It is our responsibility to protect your privacy and we guarantee that your data will be completely confidential.</span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="zcOptinOverLay" oncontextmenu="return false" style="display:none;text-align: center; background-color: rgb(0, 0, 0); opacity: 0.5; z-index: 100; position: fixed; width: 100%; top: 0px; left: 0px; height: 988px;"></div>
<div id="zcOptinSuccessPopup" style="display:none;z-index: 9999;width: 800px; height: 40%;top: 84px;position: fixed; left: 26%;background-color: #FFFFFF;border-color: #E6E6E6; border-style: solid; border-width: 1px;  box-shadow: 0 1px 10px #424242;padding: 35px;">
	<span style="position: absolute;top: -16px;right:-14px;z-index:99999;cursor: pointer;" id="closeSuccess">
		<img src="https://giay-zcmp.maillist-manage.eu/images/videoclose.png">
	</span>
	<div id="zcOptinSuccessPanel"></div>
</div>

<!--Zoho Campaigns Web-Optin Form Ends Here-->