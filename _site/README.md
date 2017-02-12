# CA-Stormwater-Data-Challenge

The Urban Drool Tool:

An Inter-Agency Collaboration Between Moulton Niguel Water District, Orange County Public Works, and the California Data Collaborative

## Introduction:

Our aim for this collaboration would be to gain insight on surface water drainage areas where altered dry weather water balance or flow regimes have been identified. Many of these stream reaches are impacted by unnatural, unpermitted, non-exempted dry weather flows (Urban Drool).

The ability to quantify and visualize the amount of Urban Drool contributing to discharges at stormdrain outfalls can help to determine the most appropriate and effective actions to restore natural water balance. The ongoing drought conditions in California have fostered the collaboration of multiple agencies and focused on the nexus of water resources as both a supply and environmental issue. Addressing systemic water overuse during the drought requires a critical investigation into Urban Drool’s role in water supply, balance and quality.

The final product will be a map overlay on top of OCPW’s catchment delineations of each monitored storm drain outfall. It will be an Urban Drool Tool that will provide flow data alongside water inefficiency data for the drainage catchments. This Urban Drool Tool will inform watershed management decisions, help employ targeted water conservation strategies, and be instrumental in addressing unnatural water balance in Orange County.


## Background:

In 2013, the San Diego Regional Water Board adopted a regional municipal separate storm sewer system (MS4) permit that requires development of a water quality improvement plan (WQIP) for each watershed management area (WMA) within its jurisdiction. The area of south Orange County (south OC) is designated as one WMA comprised of several watersheds (Aliso Creek, San Juan Creek, San Mateo Creek, Dana Point Coastal Streams, and San Clemente Coastal Streams). The municipalities of south OC are currently leading the development of a WQIP for the WMA through a public, stakeholder-driven process. The complete WQIP is due to be submitted to the San Diego Regional Water Board for review and approval by April 1, 2017. Once approved, the WQIP for south OC will identify high priority water quality conditions (HPWQCs), establish short and long term numeric water quality goals, identify strategies to meet those goals, and set schedules as well.

One of the HPWQCs that has been identified for the south OC WMA is Unnatural Water Balance and Flow Regime. The proposed strategies to address this HPWQC focus on identifying and eliminating unnatural and unpermitted, non-exempted dry weather flows from the MS4 into inland receiving waters, with priority for the locations where unnatural dry weather flow inputs arising from an unnatural urban water balance are exacerbating in-stream water quality conditions and contributing to unnatural in-stream regimes. Proposed strategies to address these flows include source control, incentives, and educational measures to promote water conservation and reduction of unnatural flows into the MS4 and structural BMP retrofit strategies to divert and capture water at high priority outfalls, where appropriate. 

Over the summer of 2016, OC Public Works performed a comprehensive dry weather flow analysis of approximately 60 stormdrain outfalls that had been identified through a dry weather outfall monitoring program that includes an inventory of 400+ stormdrain outfalls, as having persistent flow. Continuous flow monitoring was conducted at these 60 outfalls over two week time periods and then a composite scoring methodology was applied to prioritize them based on the flow, land use, and other data. 
 
A challenge in addressing this HPWQC will be to know where to target implementation of the proposed strategies on a catchment scale. The purpose of this proof of concept project submittal is to begin to explore water use data from water supply agencies in south OC can help fill data gaps and inform where to most effectively apply strategies. 

## Procedure:

As proxies for overwatering, we would use storm drain outfall flow data from OC Public Works (OCPW) and water usage and water budget data from Moulton Niguel Water District (MNWD). 

Flow from storm drain outfalls is a combination of water from Urban Drool, groundwater seepage, and local permitted discharges. Water usage accounts for both indoor and outdoor water use. MNWD also has a database of calculated water budgets for every one of their customers. It takes into account where water ends up and it budgets for the ideal: no Urban Drool. 

Moulton Niguel Water District has calculated a water budget for each household they serve https://www.mnwd.com/understandingwaterbudget/ 

Subtracting water budget from water use gives the amount of inefficient use of water. This inefficient use could be indoor or outdoor, however, Urban Drool is concerned with only outdoor water use that makes it into the storm drain. 

To estimate how much of that inefficient use is Urban Drool and how much Urban Drool contributes to the flow in the outfalls, we could create a ratio of the two proxies: inefficient water use in the drainage catchment vs. flow from outfalls. 

Using the census tract bound data from MNWD, and the drainage catchment boundaries of OCPW, the project will calculate a weighted average of water inefficiency (water usage - water budget) for every drainage catchment that we have dry weather flow data for. However, we suspect that the ratio of two week totals would enable us to prioritize education efforts.

The key end product would be the Urban Drool Tool that would showcase a relationship between storm drain outfall discharge and water inefficiency. That relationship can lead us to different management decisions. Where there are high flows during dry weather and high water inefficient use, we would investigate enhanced public water conservation education in that area. If there are high flows at an outfall but low water inefficient use in that catchment, it may make more sense to divert water than increase public education.

## Technical Hurdles:

When using inter-agency data, there is often a disconnect between siloed databases. Incongruence between databases can include differences in spatial and time granularity, abbreviations, map projections, units, and software. An additional hurdle that many data analysis projects face is a gap in necessary data; the available data often does not give a complete view of the pathways in and out of a watershed system. When attempting to model a watershed, we may see that the storm drain system is not detailed enough or the monitoring data is not expansive enough. To see where every drop of water travels is not possible with data availability and collection restrictions. Therefore, monitoring the environment in interdisciplinary ways takes time in determining database discrepancies and building available work-arounds. Sometimes well defined meta data can help to patch these differences, but other times the data gaps cannot be filled or the data needs to be manipulated further.

When using the OCPW and the MNWD databases, many of these hurdles needed to be addressed. The MNWD data set is mapped spatially by census tract while the outfall flow data from OCPW is mapped spatially by drainage catchments. Therefore, the project would need to calculate, using the data from MNWD, the spatially weighted average water inefficiency numbers for each drainage catchment that OCPW has delineated. 

Fitting the data from MNWD into the OCPW structure works well for our project in question because water quality and flow data downstream is better connected to the OCPW distribution of data. However, in the future the integration may make more sense going the opposite way, depending on the questions asked and the data available. 
Further Studies:

Currently, the scope of the tool is in identifying areas of high water use inefficiency and overwatering. By integrating with the OCPW water quality database, locations could be further prioritized based on possible contributions to degraded water quality conditions. For example, if we identify a water body with elevated nitrogen or phosphorus content, further investigation could point to over-waterers who are also over-applying fertilizer.

Another future usage of the tool is integrating the Watershed Infiltration and Hydromodification Management Plan (WIHMP) and OverwateringIsOut.org databases of BMP and LID projects. By comparing with the MNWD and OCPW data sets, we can visualize not just if they are helping to improve water quality, but also if we are prioritizing the right location to capture and treat Urban Drool and if our public education programs are effective.

As smart meters become more prevalent among water districts, we expect to see an increase in data granularity. Currently, the water usage efficiency data is reported on a monthly basis while OCPW outfall flow monitoring is performed at two week intervals per site. Therefore, to integrate these two data sets, we assume that flow trends at the outfall remain steady even extending past the two week monitoring period. Increased time granularity provided by smart water meters would allow for more accurate relationships to be drawn and pinpoint exact times of each month where overwatering is more prevalent. A future implementation of this tool would be more accurate at directing water conservation and education efforts.

As with any large data project, we designed a pilot project with the MNWD to determine feasibility and to catalog procedures and common data discrepancies between public works stormwater data and water district data. Our hope is to expand this proof of concept to additional water districts to create a helpful and powerful tool for all of Orange County’s water management. 
References
U.S Environmental Protection Agency. Outdoor Water Use in the United States. Retrieved from https://www3.epa.gov/watersense/pubs/outdoor.html
San Diego Regional Water Quality Control Board. Water Quality Improvement Plans. Retrieved from http://www.waterboards.ca.gov/sandiego/water_issues/programs/stormwater/wqip.shtml
Orange County Water Quality Improvement Plan, B.3 Chapter https://ocgov.box.com/s/u15i2gp306kqhxgjieyg7y5zqgkffkpy 


