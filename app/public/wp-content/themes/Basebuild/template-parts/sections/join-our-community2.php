<!--Zoho Campaigns Web-Optin Form Starts Here-->
<script type="text/javascript" src="https://giay-zcmp.maillist-manage.eu/js/optin.min.js" onload="setupSF('sf3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44','ZCFORMVIEW',false,'light',false,'0')"></script>
<script type="text/javascript">
	function runOnFormSubmit_sf3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44(th) {
		/*Before submit, if you want to trigger your event, "include your code here"*/
	};
</script>
<meta content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

<section class="join bg-blue section-small">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12 u-flex-column" data-sal="fade-in" data-sal-delay="100" data-sal-easing="ease-out-quart"> 
				<?php echo get_field('join_our_community', 'option'); ?>
				<div class="lips">
						<!-- <img src="<?php //echo get_template_directory_uri() ?>/dist/img/lips.png" alt="lips"> -->
						<img src="<?php echo get_template_directory_uri() ?>/dist/img/Ceri-Newsletter.gif" alt="newsletter">
					</div>
			</div>
			<div class="col-md-6 col-sm-12 join-form" data-sal="fade-in" data-sal-delay="100" data-sal-easing="ease-out-quart">

				<div id="sf3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44" data-type="signupform">
					<div id="customForm">
						<input type="hidden" id="recapTheme" value="0">
						<input type="hidden" id="isRecapIntegDone" value="false">
						<input type="hidden" id="recapMode" value="143404000000478017">
						<input type="hidden" id="signupFormType" value="LargeForm_Vertical">
						<input type="hidden" id="scriptless" name="scriptless" value="yes">
						<div name="SIGNUP_PAGE" id="SIGNUP_PAGE" class="SIGNUP_PAGE large_form_10_css">
							<div>
								<div name="" changeid="" changename="">
									<div id="imgBlock" name="LOGO_DIV" logo="true"></div>
								</div>
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
											<div class="pink-text" changeid="SIGNUP_MSG" id="SIGNUP_DESCRIPTION" changetype="SIGNUP_DESCRIPTION"></div>
											<div id="errorMsgDiv"></div>
											<label name="SIGNUP_FORM_LABEL" class="signup-form-label">First Name&nbsp; <span name="SIGNUP_REQUIRED">*</span></label>
											<input name="FIRSTNAME" changeitem="SIGNUP_FORM_FIELD" maxlength="100" type="text" required="true" value="">

											<label name="SIGNUP_FORM_LABEL" class="signup-form-label">Last Name&nbsp;<span name="SIGNUP_REQUIRED">*</span></label>

											<input name="LASTNAME" changeitem="SIGNUP_FORM_FIELD" maxlength="100" type="text" required="true" value="">
											<span style="display:none" id="dt_LASTNAME">1,true,1,Last Name,2</span>


											<label name="SIGNUP_FORM_LABEL" class="signup-form-label">Contact Email&nbsp;<span name="SIGNUP_REQUIRED">*</label>
												<div><!-- check to mark emailid field as type email, and other mandatory fields as type required -->
													<input name="CONTACT_EMAIL" changeitem="SIGNUP_FORM_FIELD" maxlength="100" type="email" required="true" value="">

													<label name="SIGNUP_FORM_LABEL" class="signup-form-label">Where Did You Hear About Us?&nbsp;</label>
													<select name="CONTACT_CF12" changeitem="SIGNUP_FORM_FIELD" multiple="multiple" zc_display_name="Where Did You Hear About Us?">
														<option value="Social Media">Social Media</option>
														<option value="Google">Google</option>
														<option value="Podcast">Podcast</option>
														<option value="Recommendation">Recommendation</option>
														<option value="Other">Other</option>
													</select>
												

													
													
													<div>
														<br>
														<span class="wpcf7-form-control-wrap" data-name="Newsletter"><span class="wpcf7-form-control wpcf7-checkbox pink"><span class="wpcf7-list-item first last"><label>
														<input type="checkbox" style="vertical-align:middle" name="PRIVACY_POLICY" value="PRIVACY_AGREED">
														<span class="wpcf7-list-item-label">I agree to the&nbsp;<a
                                                        href="/privacy-policy/" target="_blank"
                                                        style="text-decoration:none">Privacy Policy</a>&nbsp;and&nbsp;<a
                                                        href="/website-terms-of-use/"
                                                        target="_blank" style="text-decoration:none">Terms of
                                                        Use</a>&nbsp;</span></label></span></span>
													</div>


													
													<div id="REQUIRED_FIELD_TEXT" changetype="REQUIRED_FIELD_TEXT" name="SIGNUP_REQUIRED">
														<span class="small">*Required Fields</span>
														<br>
													</div>
													<br>
													<div class="join-buttons">
														<input type="button" action="Save" id="zcWebOptin" name="SIGNUP_SUBMIT_BUTTON" changetype="SIGNUP_SUBMIT_BUTTON_TEXT" value="Sign Up">
														<!-- &nbsp;&nbsp;
														<a href="#more-info" class="btn btn-transparent">More Info</a> -->
													</div>

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
													<input type="hidden" id="zc_formIx" name="zc_formIx" value="3z02a637d1d8b5e18400b3e78c2603c0cc4f91ec4bda24f4ea7e9aaf79845c0c44"><!-- End of the campaigns hidden tags -->

													<input type="hidden" id="isCaptchaNeeded" value="true">
													<input type="hidden" id="superAdminCap" value="0">
													<img src="https://giay-zcmp.maillist-manage.eu/images/spacer.gif" onload="referenceSetter(this)" id="refImage" alt="campaigns image">

												</div>
											</div>
											<div id="zcOptinOverLay" oncontextmenu="return false" style="display:none;text-align: center; background-color: rgb(0, 0, 0); opacity: 0.5; z-index: 100; position: fixed; width: 100%; top: 0px; left: 0px; height: 988px;"></div>
											<div id="zcOptinSuccessPopup" style="display:none;z-index: 9999;width: 800px; height: 40%;top: 84px;position: fixed; left: 26%;background-color: #FFFFFF;border-color: #E6E6E6; border-style: solid; border-width: 1px;  box-shadow: 0 1px 10px #424242;padding: 35px;">
												<span style="position: absolute;top: -16px;right:-14px;z-index:99999;cursor: pointer;" id="closeSuccess">
													<img src="https://giay-zcmp.maillist-manage.eu/images/videoclose.png">
												</span>
												<div id="zcOptinSuccessPanel"></div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>






